import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wallpaperapp/Constants/Constants.dart';
import 'package:wallpaperapp/Screens/FullViewWallpaper.dart';
import 'package:wallpaperapp/Widgets/Others/ShimmerEffectGridView.dart';
import '../Providers/WallProvider.dart';

class MainGridView extends StatelessWidget {

  const MainGridView({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WallpaperProvider>(
      builder: (context,wallProvider,child){
        if(wallProvider.isLoading == true){
          return const GridViewShimmer();
        }else{
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GridView.builder(
              itemCount: wallProvider.images.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent: 300,
              ),
              itemBuilder: (context,index){
                final String imageUrl = wallProvider.images[index].imageUrl;
                final String downloadUrl = wallProvider.images[index].downloadUrl;
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
        }
      },
    );
  }
}
