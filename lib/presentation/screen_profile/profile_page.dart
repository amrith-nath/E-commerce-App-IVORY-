import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ivory/presentation/core/constant/size/constant_size.dart';
import 'package:ivory/presentation/screens_onboarding/widgets/elevated_button_widget.dart';

import '../core/constant/font/google_font.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey.shade400,
        ),
        kHeight10,
        Text(
          FirebaseAuth.instance.currentUser!.email.toString(),
          style: GoogleFont.cardSubText,
        ),
        Divider(
          color: Colors.grey.shade500,
        ),
        kHeight,
        profileTileWidget(Icons.location_on, 'Address'),
        profileTileWidget(Icons.inventory_2_rounded, 'Orders'),
        profileTileWidget(Icons.favorite_rounded, 'My Wishlist'),
        profileTileWidget(Icons.stars_rounded, 'Rewards'),
        kHeight,
        ElevatedButtonWidget(
            color: Colors.grey.shade300,
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            title: 'Sign Out',
            titleStyle: GoogleFont.textButtonStyleRed)
      ],
    );
  }

  ListTile profileTileWidget(IconData icon, String title) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: GoogleFont.cardMainText,
      ),
    );
  }
}
