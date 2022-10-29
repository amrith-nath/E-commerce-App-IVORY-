import 'package:flutter/material.dart';
import 'package:ivory/presentation/core/constant/size/constant_size.dart';
import 'package:ivory/presentation/screens_onboarding/widgets/elevated_button_widget.dart';

import '../core/constant/font/google_font.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Sign Out',
                    style: GoogleFont.textButtonStyleGrey,
                  ))
            ],
          ),
        ),
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey.shade400,
        ),
        kHeight10,
        Text(
          'example2022@gmail.com',
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
              Navigator.pop(context);
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
