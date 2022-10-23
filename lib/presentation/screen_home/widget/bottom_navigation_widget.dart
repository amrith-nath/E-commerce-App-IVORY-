import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ivory/applicatoin/cubits/bottomNavigation/bottom_navigation_cubit.dart';
import 'package:ivory/presentation/core/constant/color/colors.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      builder: (context, state) {
        return DotNavigationBar(
          currentIndex: state.index,
          onTap: (index) {
            BlocProvider.of<BottomNavigationCubit>(context)
                .getCurrentIndex(currentIndex: index);
          },
          // dotIndicatorColor: Colors.black,
          items: [
            /// Home
            DotNavigationBarItem(
              icon: Icon(Icons.home),
              selectedColor: Colors.purple,
            ),

            /// Likes
            DotNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              selectedColor: Colors.pink,
            ),

            /// Search
            DotNavigationBarItem(
              icon: Icon(Icons.search),
              selectedColor: Colors.orange,
            ),

            /// Profile
            DotNavigationBarItem(
              icon: Icon(Icons.person),
              selectedColor: Colors.teal,
            ),
          ],
        );
      },
    );
  }
}
// SizedBox(
//           height: 70,
//           child: PhysicalModel(
//             elevation: 10,
//             color: Colors.black,
//             child: SlidingClippedNavBar(
//               activeColor: Colors.black,
//               inactiveColor: xYellow,
//               barItems: [
//                 BarItem(
//                   title: 'Home',
//                   icon: Icons.home,
//                 ),
//                 BarItem(
//                   title: 'Wishlist',
//                   icon: Icons.favorite,
//                 ),
//                 BarItem(
//                   title: 'Notification',
//                   icon: Icons.sports_basketball,
//                 ),
//                 BarItem(
//                   title: 'Feed',
//                   icon: Icons.feed,
//                 ),
//               ],
//               selectedIndex: state.index,
//               onButtonPressed: (index) {
//                 BlocProvider.of<BottomNavigationCubit>(context)
//                     .getCurrentIndex(currentIndex: index);
//               },
//             ),
//           ),
//         );