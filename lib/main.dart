import 'package:clinic_app/ClinicCubits/Login_Cubit/cubit/login_cubit.dart';
import 'package:clinic_app/ClinicCubits/Resister_Cubit/cubit/register_cubit.dart';
import 'package:clinic_app/Helper/cache_helper.dart';
import 'package:clinic_app/Helper/dio_helper.dart';
import 'package:clinic_app/Pages/home_page.dart';
import 'package:clinic_app/Pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Pages/login_page.dart';
import 'Pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.Init_dio();

  await CacheHelper.init();
  runApp(const ClinicApp());
}

class ClinicApp extends StatelessWidget {
  const ClinicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubitCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
      ],
      child: MaterialApp(
        home: SplashPage(),
        debugShowCheckedModeBanner: false,
        routes: {
          LoginPage.id: (context) => LoginPage(),
          RegisterPage.id: (context) => RegisterPage(),
          HomePage.id:(context) => HomePage(),
        },
      ),
    );
  }
}
