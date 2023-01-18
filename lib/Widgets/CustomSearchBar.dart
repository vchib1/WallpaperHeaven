import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaperapp/Providers/SearchProvider.dart';
import 'package:wallpaperapp/Screens/SearchPage.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({Key? key}) : super(key: key);


  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {

  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    searchRoute(String val){
      if(textEditingController.value.text.isNotEmpty){
        Provider.of<SearchProvider>(context,listen: false).getQuery(val);
        Provider.of<SearchProvider>(context,listen: false).isLoading = true;
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchPage(),));
        textEditingController.clear();
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text("Search field is empty!!"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextField(
          onSubmitted: (value){
            searchRoute(value);
          },
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: "Search",
            suffixIcon: IconButton(
              onPressed: () {
                searchRoute(textEditingController.value.text);
              },
              icon: const Icon(Icons.search),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
