import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchResults = [
    'All',
    'Fasion',
    'Footwears',
    'Bags',
    'Watch',
    "Toys",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
        // close(context, null);
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back,
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
              trailing: const Icon(Icons.close),
            ));
  }
}
