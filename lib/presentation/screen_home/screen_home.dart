import 'package:flutter/material.dart';
import 'package:ivory/presentation/screen_home/widget/app_bar_widget.dart';
import 'package:ivory/presentation/screen_home/widget/home.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, 200),
        child: AppBarWidget(size: size),
      ),
      body: const Home(),
      // bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
