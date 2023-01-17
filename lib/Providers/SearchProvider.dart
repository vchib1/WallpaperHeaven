import 'package:flutter/material.dart';

import '../Models/ImageModel.dart';
import '../Services/API_Service.dart';

class SearchProvider with ChangeNotifier{

  List<ImageModel> images = [];
  bool isLoading = true;
  String _query = "";

  String get query => _query;

  getQuery(String value){
    _query = value;
    searchImages();// only gets called when user hit search button
  }

  Future<void> searchImages()async{
    List<dynamic> listImages = await ApiClass.searchWallpapers(_query);

    List<ImageModel> temp = [];

    for(var image in listImages){
      ImageModel imageModel = ImageModel.fromJson(image);
      temp.add(imageModel);
    }
    images = temp;
    isLoading = false;
    notifyListeners();
  }

}