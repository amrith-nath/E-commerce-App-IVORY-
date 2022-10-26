import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ivory/applicatoin/cubits/bottomNavigation/bottom_navigation_cubit.dart';
import 'package:ivory/presentation/core/constant/color/colors.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      builder: (context, state) {
        return SalomonBottomBar(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          currentIndex: state.index,
          onTap: (newIndex) {
            BlocProvider.of<BottomNavigationCubit>(context)
                .getCurrentIndex(currentIndex: newIndex);
          },
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: SvgPicture.asset('asset/svgs/home-alt-2.svg'),
              title: const Text(
                "Home",
                style: TextStyle(
                  fontSize: 11,
                ),
              ),
              selectedColor: xHeadTextColor,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: SvgPicture.asset('asset/svgs/category-alt.svg'),
              title: const Text(
                "Catagories",
                style: TextStyle(
                  fontSize: 11,
                ),
              ),
              selectedColor: xHeadTextColor,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: const Icon(Icons.notifications_outlined),
              title: const Text(
                "Alerts",
                style: TextStyle(
                  fontSize: 11,
                ),
              ),
              selectedColor: xHeadTextColor,
            ),
            SalomonBottomBarItem(
              icon: SvgPicture.asset('asset/svgs/user.svg'),
              title: const Text(
                "User",
                style: TextStyle(
                  fontSize: 11,
                ),
              ),
              selectedColor: xHeadTextColor,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: SvgPicture.asset(
                'asset/svgs/shopping-cart.svg',
                width: 25,
              ),
              title: const Text(
                "Cart",
                style: TextStyle(
                  fontSize: 11,
                ),
              ),
              selectedColor: xHeadTextColor,
            ),
          ],
        );
      },
    );
  }
}
// DotNavigationBar(
//           enableFloatingNavBar: true,

//           currentIndex: state.index,
//           onTap: (index) {
//             BlocProvider.of<BottomNavigationCubit>(context)
//                 .getCurrentIndex(currentIndex: index);
//           },
//           // dotIndicatorColor: Colors.black,
//           items: [
//             /// Home
//             DotNavigationBarItem(
//               icon: Icon(Icons.home),
//               selectedColor: Colors.purple,
//             ),

//             /// Likes
//             DotNavigationBarItem(
//               icon: Icon(Icons.favorite_border),
//               selectedColor: Colors.pink,
//             ),

//             /// Search
//             DotNavigationBarItem(
//               icon: Icon(Icons.search),
//               selectedColor: Colors.orange,
//             ),

//             /// Profile
//             DotNavigationBarItem(
//               icon: Icon(Icons.person),
//               selectedColor: Colors.teal,
//             ),
//           ],
//         );