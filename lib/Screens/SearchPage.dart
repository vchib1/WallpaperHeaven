import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:wallpaperapp/Providers/SearchProvider.dart';
import 'package:wallpaperapp/Widgets/SearchGridView.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    String query = Provider.of<SearchProvider>(context).query;
    return Scaffold(
      appBar: AppBar(
        title: Text("Results for \"$query\""),
      ),
      body: const SingleChildScrollView(
          child: SearchGridView(),
      ),
    );
  }
}
