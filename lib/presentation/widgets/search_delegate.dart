import 'package:flutter/material.dart';

class MainSearchDelegate extends SearchDelegate {
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
