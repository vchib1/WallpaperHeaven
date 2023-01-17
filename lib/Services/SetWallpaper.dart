import 'package:dio/dio.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart';

class SetWallpaper{

  static Future<void> saveFile(String imageUrl)async {
    if(await Permission.storage.request().isGranted){
      var response = await Dio().get(imageUrl,
          options: Options(responseType: ResponseType.bytes));
      final result = await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
      //print(result);
    }
  }
}