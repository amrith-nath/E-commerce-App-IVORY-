import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ivory/applicatoin/bloc/login/login_bloc.dart';
import 'package:ivory/presentation/core/themes/themes.dart';
import 'package:ivory/presentation/screen_splash/screen_splash.dart';

import 'applicatoin/cubits/onboarding/onboarding_cubit.dart';

void main(List<String> args) {
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
          create: (context) => LoginBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ivory',
        theme: xThemeData,
        home: const ScreenSplash(),
      ),
    );
  }
}
