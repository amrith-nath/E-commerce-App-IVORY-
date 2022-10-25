import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ivory/presentation/screen_home/widget/app_bar_widget.dart';
import 'package:ivory/presentation/screen_home/widget/home.dart';

import 'widget/bottom_navigation_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
    ));
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, 200),
        child: AppBarWidget(size: size),
      ),
      body: const Home(),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey.shade600))),
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
