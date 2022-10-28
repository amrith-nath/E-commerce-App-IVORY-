import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ivory/applicatoin/cubits/bottomNavigation/bottom_navigation_cubit.dart';
import 'package:ivory/presentation/screen_alerts/screen_alerts.dart';
import 'package:ivory/presentation/screen_cart/screen_cart.dart';
import 'package:ivory/presentation/screen_home/widget/app_bar_widget.dart';
import 'package:ivory/presentation/screen_home/widget/home.dart';
import 'package:ivory/presentation/screen_profile/screen_profile.dart';
import 'package:ivory/presentation/screen_catagories/screen_catagories.dart';

import 'widget/bottom_navigation_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
    ));
    var size = MediaQuery.of(context).size;

    List<Widget> navigationRoutes = const [
      Home(
        key: Key('home'),
      ),
      ScreenCatagories(
        key: Key('wishlist'),
      ),
      ScreenAlerts(
        key: Key('alerts'),
      ),
      ScreenProfile(
        key: Key('profile'),
      ),
      ScreenCart(
        key: Key('cart'),
      ),
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, 200),
        child: AppBarWidget(size: size),
      ),
      body: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
        builder: (context, state) {
          return PageTransitionSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
              return SharedAxisTransition(
                transitionType: SharedAxisTransitionType.vertical,
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
            child: navigationRoutes[state.index],
          );
        },
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey.shade300))),
        child: PhysicalModel(
          color: Colors.white,
          child: Column(
            children: const [
              BottomNavigationWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
