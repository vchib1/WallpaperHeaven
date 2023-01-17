import 'package:flutter/material.dart';
import 'package:wallpaperapp/Widgets/CategoryListView.dart';
import '../Widgets/MainPageGridView.dart';
import '../Widgets/CustomSearchBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }
  @override
  dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const SliverAppBar(
            floating: true,
            centerTitle: true,
            title: Text("Wallpaper Heaven",),
          )
        ],
        body: Scrollbar(
          radius: const Radius.circular(10),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: const [
                //Category
                SizedBox(height: 10,),
                CategoryListView(),
                SizedBox(height: 10,),

                //Search Bar
                CustomSearchBar(),
                SizedBox(height: 0,),

                //Gridview for Photos
                MainGridView(),
                SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      )
      // body: Scrollbar(
      //   radius: const Radius.circular(10),
      //   child: SingleChildScrollView(
      //     physics: const BouncingScrollPhysics(),
      //     child: Column(
      //       children: const [
      //         //Category
      //         SizedBox(height: 10,),
      //         CategoryListView(),
      //         SizedBox(height: 10,),
      //
      //         //Search Bar
      //         CustomSearchBar(),
      //         SizedBox(height: 10,),
      //
      //         //Gridview for Photos
      //         MainGridView(),
      //         SizedBox(height: 10,),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
