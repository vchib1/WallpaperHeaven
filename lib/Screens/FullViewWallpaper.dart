import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallpaperapp/Constants/Constants.dart';
import 'package:wallpaperapp/Services/SetWallpaper.dart';

class FullViewWallpaper extends StatelessWidget {

  final String imageUrl;
  final String downloadUrl;

  const FullViewWallpaper({Key? key,
    required this.imageUrl,
    required this.downloadUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: imageUrl,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(imageUrl),
                    fit: BoxFit.cover,
                    //filterQuality: FilterQuality.medium,
                  )
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: borderAll,
                      border: whiteBorder,
                      color: Colors.black.withOpacity(.15),
                    ),
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back,color: Colors.white,),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: borderAll,
                      border: whiteBorder,
                      color: Colors.black.withOpacity(.15),
                    ),
                    child: IconButton(
                      onPressed: () {
                        SetWallpaper.saveFile(downloadUrl);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              behavior: SnackBarBehavior.floating,
                              duration: Duration(seconds: 3),
                              content: Text("Image Saved to Gallery"),
                            )
                        );
                      },
                      icon: const Icon(Icons.download,color: Colors.white,),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 8.0),
              child: GestureDetector(
                onTap: (){
                  showDialog(context: context, builder: (context){
                    return SimpleDialog(
                      children: [
                        ListTile(
                          title: const Text("Homescreen"),
                          onTap: (){
                            Navigator.pop(context, "Homescreen");
                            SetWallpaper.saveFile(imageUrl);
                          },
                        ),
                        ListTile(
                          title: const Text("Lockscreen"),
                          onTap: (){
                            Navigator.pop(context, "Lockscreen");
                          },
                        ),
                        ListTile(
                          title: const Text("Both Screens"),
                          onTap: (){
                            Navigator.pop(context, "Both Screens");
                          },
                        ),
                      ],
                    );
                  }).then((val){
                    if(val != null){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Wallpaper Applied as: $val"),
                          action: SnackBarAction(
                            label: "OK",
                            onPressed: (){},
                          ),
                        )
                      );
                    }
                  });
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * .80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    border: whiteBorder,
                    borderRadius: borderAll2
                  ),
                  child: const Text("Set Wallpaper",style: setStyle,),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
