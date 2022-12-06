import 'package:flutter/material.dart';
import 'package:ivory/infrastructure/repositories/product_repo/product_repo.dart';
import 'package:ivory/presentation/core/constant/font/google_font.dart';

import '../../domine/models/product/product_model.dart';
import '../../domine/models/user/user_model.dart';
import '../screen_product/screen_product.dart';

class MainSearchDelegate extends SearchDelegate {
  // List<String> searchResults = [
  //   'All',
  //   'Fasion',
  //   'Footwears',
  //   'Bags',
  //   'Watch',
  //   "Toys",
  // ];
  MainSearchDelegate(this.pList, this.user);
  List<ProductModel> pList;
  UserModel user;
  ProductRepo productRepo = ProductRepo();

  @override
  ThemeData appBarTheme(context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      CircleAvatar(
        backgroundColor: Colors.grey.shade300,
        radius: 15,
        child: IconButton(
          onPressed: () {
            close(context, null);
            // close(context, null);
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close_rounded,
            color: Colors.black,
            size: 15,
          ),
        ),
      ),
      const SizedBox(width: 15)
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        query = '';
      },
      icon: const Icon(
        Icons.clear_all_rounded,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<ProductModel> searchResultsProducts = pList;

    // List<String> productList = await productRepo.getProductsAsList();
    List<ProductModel> matchQuery = searchResultsProducts
        .where((element) => element.name.contains(query))
        .toList();
    List<Widget> searchResults = matchQuery
        .map((element) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => ScreenProduct(
                        product: element,
                        user: user,
                      ),
                    ));
                  },
                  leading: Image.network(element.images[0]),
                  title: Text(
                    element.name.toUpperCase(),
                    style: GoogleFont.cardMainText,
                  ),
                  trailing: Text(
                    element.price.toString().toUpperCase(),
                    style: GoogleFont.cardSubText,
                  ),
                ),
              ),
            ))
        .toList();
    if (matchQuery.isEmpty) {
      return Center(
          child: Text(
        "'$query' returns No Results",
        style: GoogleFont.dropDownText,
      ));
    } else {
      return ListView(
        children: [
          ...searchResults,
          const Divider(
            color: Colors.grey,
          ),
        ],
      );
    }

    // return FutureBuilder(
    //     future: productRepo.getProductsAsList(),
    //     builder: (context, snapshot) {
    //       for (var e in snapshot.data!) {
    //         if (e.name.toLowerCase().contains(query.toLowerCase())) {
    //           matchQuery.add(e.name);
    //         }
    //       }
    //       return ListView.builder(
    //           physics: const BouncingScrollPhysics(),
    //           itemCount: matchQuery.length,
    //           itemBuilder: (context, index) => ListTile(
    //                 title: Text(matchQuery[index]),
    //               ));
    //     });
  }

  Future<List<ProductModel>> getResults() async {
    return await productRepo.getProductsAsList();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> searchResults = [
      'All',
      'Fasion',
      'Footwears',
      'Bags',
      'Watch',
      "Toys",
    ];
    List<String> matchQuery = [];

    for (String e in searchResults) {
      if (e.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(e);
      }
    }

    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: matchQuery.length,
        itemBuilder: (context, index) => ListTile(
              title: Text(matchQuery[index]),
            ));
  }
}

class ProductSearchDelegate extends SearchDelegate {
  List<String> searchResults = [
    'All',
    'Fasion',
    'Footwears',
    'Bags',
    'Watch',
    "Toys",
  ];

  @override
  ThemeData appBarTheme(context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      CircleAvatar(
        backgroundColor: Colors.grey.shade300,
        radius: 15,
        child: IconButton(
          onPressed: () {
            close(context, null);
            // close(context, null);
            // Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close_rounded,
            color: Colors.black,
            size: 15,
          ),
        ),
      ),
      const SizedBox(width: 15)
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        query = '';
      },
      icon: const Icon(
        Icons.clear_all_rounded,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];

    for (String e in searchResults) {
      if (e.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(e);
      }
    }

    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: matchQuery.length,
        itemBuilder: (context, index) => ListTile(
              title: Text(matchQuery[index]),
            ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];

    for (String e in searchResults) {
      if (e.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(e);
      }
    }

    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: matchQuery.length,
        itemBuilder: (context, index) => ListTile(
              title: Text(matchQuery[index]),
            ));
  }
}
