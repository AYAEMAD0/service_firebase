import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'features/login/cubit/login_cubit.dart';
import 'features/login/view/login_view.dart';
import 'features/categories/cubit/get_category_cubit.dart';
import 'features/categories/view/category_view.dart';
import 'features/categories/view/category_products_view.dart';
import 'features/categories/model/get_category_model.dart';
import 'firebase_options.dart';
import 'network/dio_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('authBox');
  DioHelper().initialization();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => BlocProvider(
          create: (context) => LoginCubit(),
          child: const LoginView(),
        ),
        '/category': (context) => BlocProvider(
          create: (context) => GetCategoryCubit(),
          child: const CategoryView(),
        ),
        '/category_products': (context) => CategoryProductsView(
          category: Data(),
        ),
      },
    );
  }
}
