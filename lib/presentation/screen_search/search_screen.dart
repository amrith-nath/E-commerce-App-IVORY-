import 'package:flutter/material.dart';

import '../../domine/models/product/product_model.dart';
import '../widgets/search_delegate.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({Key? key, required this.pList}) : super(key: key);
  List<ProductModel> pList;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await Future.delayed(const Duration(milliseconds: 350));
        showSearch(
          context: context,
          delegate: MainSearchDelegate(pList: pList),
          useRootNavigator: true,
        );
      },
    );

    return const Scaffold();
  }
}
