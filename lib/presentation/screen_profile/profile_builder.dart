import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ivory/presentation/core/constant/color/colors.dart';
import 'package:ivory/presentation/core/constant/font/google_font.dart';
import 'package:ivory/presentation/screen_profile/profile_page.dart';
import 'package:ivory/presentation/screen_profile/screen_profile.dart';

class ProfileBulder extends StatelessWidget {
  const ProfileBulder({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const ProfilePage();
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Something went wrong',
                style: GoogleFont.textButtonStyleRed,
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(
                      color: xYellow,
                    )));
          } else {
            return const ScreenProfile();
          }
        });
  }
}
