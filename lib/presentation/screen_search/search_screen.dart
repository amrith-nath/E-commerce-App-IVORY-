import 'package:flutter/material.dart';

import '../widgets/search_delegate.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await Future.delayed(const Duration(milliseconds: 350));
        showSearch(
          context: context,
          delegate: CustomSearchDelegate(),
          useRootNavigator: true,
        );
      },
    );

    return const Scaffold();
  }
}
