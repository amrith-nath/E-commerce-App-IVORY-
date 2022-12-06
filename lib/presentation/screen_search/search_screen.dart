import 'package:flutter/material.dart';
import 'package:ivory/domine/models/product/product_model.dart';
import 'package:ivory/domine/models/user/user_model.dart';
import 'package:ivory/infrastructure/repositories/product_repo/product_repo.dart';
import 'package:ivory/infrastructure/repositories/user_repo/user_repo.dart';

import '../widgets/search_delegate.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({Key? key}) : super(key: key);
  ProductRepo productRepo = ProductRepo();
  UserRepo userRepo = UserRepo();
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        List<ProductModel> pList = await productRepo.getProductsAsList();
        UserModel user = await userRepo.getuser();
        showSearch(
          context: context,
          delegate: MainSearchDelegate(pList, user),
          useRootNavigator: true,
        );
      },
    );

    return const Scaffold();
  }
}
