import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ivory/applicatoin/bloc/user_bloc/user_bloc.dart';
import 'package:ivory/applicatoin/cubits/bottomNavigation/bottom_navigation_cubit.dart';
import 'package:get/get.dart';

import 'package:ivory/presentation/core/themes/themes.dart';
import 'package:ivory/presentation/screen_splash/screen_splash.dart';

import 'applicatoin/bloc/cart_bloc/cart_bloc.dart';
import 'applicatoin/bloc/homeBloc/home_bloc.dart';
import 'applicatoin/cubits/onboarding/onboarding_cubit.dart';

Future main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnboardingCubit(),
        ),
        BlocProvider(
          create: (context) => BottomNavigationCubit(),
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => UserBloc(),
        ),
        BlocProvider(
          create: (context) => CartBloc(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ivory',
        theme: xThemeData,
        home: const ScreenSplash(),
      ),
    );
  }
}
