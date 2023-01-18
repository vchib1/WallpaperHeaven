import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaperapp/Providers/WallProvider.dart';
import '../Constants/Constants.dart';
import '../Providers/CategoryProvider.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late int selected;
    final List<String> category = ["Home","Animals","Nature","Science","Art","Futuristic","Cars","Superhero","Gaming","Sports","Space"];

    return SizedBox(
      height: 40,
      child: ListView.builder(
        itemCount: category.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          selected = Provider.of<CategoryProvider>(context,listen: true).index;
          return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: GestureDetector(
              onTap: (){
                Provider.of<CategoryProvider>(context,listen: false).getIndex(index);
                Provider.of<WallpaperProvider>(context,listen: false).isLoading = true;
                Provider.of<WallpaperProvider>(context,listen: false).getCategory(category[index]);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: selected == index ? primaryColor : greyColor,
                  borderRadius: onlyLeftRight,
                  border: selected == index ? mainBorder : otherBorder,
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child:  Text(category[index],style: selected == index ? textStyle1 : textStyle2,),
                ),
              )
            ),
          );
        },
      ),
    );
  }
}
