import 'package:flutter/material.dart';
import '../Models/ImageModel.dart';
import '../Services/API_Service.dart';

class WallpaperProvider with ChangeNotifier{

  List<ImageModel> images = [];

  bool isLoading = true;

  String _category = "Home";
  String get category => _category;

  getCategory(String value){
    _category = value;
    isLoading = true;
    fetchImages();
    notifyListeners();
  }

  WallpaperProvider(){
    fetchImages();
  }

  Future<void> fetchImages()async{
    List<dynamic> listImages = await ApiClass.getWallpapers(_category);

    List<ImageModel> temp = [];

    for(var image in listImages){
      ImageModel imageModel = ImageModel.fromJson(image);
      temp.add(imageModel);
    }
    isLoading = false;
    images = temp;

    notifyListeners();
  }
}