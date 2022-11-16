import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ivory/applicatoin/cubits/bottomNavigation/bottom_navigation_cubit.dart';
import 'package:ivory/presentation/core/themes/themes.dart';
import 'package:ivory/presentation/screen_splash/screen_splash.dart';

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
