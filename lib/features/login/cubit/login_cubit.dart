
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import '../../../network/api_const.dart';
import '../../../network/dio_helper.dart';
import '../../../network/hive_helper.dart';
import '../model/login_model.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  LoginModel? loginModel;

  Future<void> login(Map<String, dynamic> data) async {
    emit(LoginLoading());

    try {
      final result = await DioHelper().postData(
        ApiConst.login,
        data: data,
      );

      if (result.statusCode == 200) {
        loginModel = LoginModel.fromJson(
          Map<String, dynamic>.from(result.data),
        );

        if (loginModel?.statusCode == 200 &&
            loginModel?.data?.token != null) {
          await HiveHelper.setToken(
            loginModel!.data!.token!,
          );

          emit(LoginSuccess());
        }
      }
    } catch (e) {
      emit(LoginError(messageError: e.toString()));
    }
  }
  Future<void> loginWithFirebase(Map<String, dynamic> data) async {
    emit(LoginLoading());

    try {
      final credential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );

      final user = credential.user;

      if (user != null) {
        final token = await user.getIdToken();

        if (token != null) {
          await HiveHelper.setToken(token);
        }

        emit(LoginSuccess());
      }
    } on FirebaseAuthException catch (e) {
      emit(LoginError(messageError: e.message ?? e.code));
    } catch (e) {
      emit(LoginError(messageError: e.toString()));
    }
  }}
