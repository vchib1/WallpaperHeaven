import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier{

  int _index = 0;

  int get index => _index;

  getIndex(int index){
    _index = index;
    notifyListeners();
  }

}