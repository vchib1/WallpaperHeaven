import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaperapp/Constants/Constants.dart';
import 'package:wallpaperapp/Providers/SearchProvider.dart';
import 'package:wallpaperapp/Screens/FullViewWallpaper.dart';
import 'package:wallpaperapp/Widgets/Others/ShimmerEffectGridView.dart';

class SearchGridView extends StatelessWidget {


  const SearchGridView({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: (context,searchProvider,child){
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: searchProvider.isLoading ? const GridViewShimmer()
          :
          GridView.builder(
            itemCount: searchProvider.images.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 300,
            ),
            itemBuilder: (context,index){
              final String imageUrl = searchProvider.images[index].imageUrl;
              final String downloadUrl = searchProvider.images[index].downloadUrl;
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FullViewWallpaper(imageUrl: imageUrl,downloadUrl: downloadUrl),));
                },
                child: Hero(
                  tag: imageUrl,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: borderAll,
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(imageUrl),
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.medium,
                        )
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}