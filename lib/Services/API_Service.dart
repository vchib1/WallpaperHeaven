import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClass{

  static Future<List<dynamic>> getWallpapers(String category)async {

    //var mainUrl, mainHeaders;
    String mainUrl = "";
    Map<String,String> mainHeaders = {};

    if(category == 'Home'){
      var baseUrl = "https://api.pexels.com/v1/curated?page=1&per_page=80";
      var headers = {
        'Authorization': '563492ad6f917000010000018afaccf5b3c942e3aa800733b7049524',
      };
      mainUrl = baseUrl;
      mainHeaders = headers;
    }else{
      var baseUrl = "https://api.pexels.com/v1/search?query=$category&per_page=80";
      var headers = {
        'Authorization': '563492ad6f917000010000018afaccf5b3c942e3aa800733b7049524',
      };
      mainUrl = baseUrl;
      mainHeaders = headers;
    }

    var result = await http.get(Uri.parse(mainUrl), headers: mainHeaders);
    var decodedResponse = jsonDecode(result.body);
    List walls = decodedResponse['photos'];

    if (result.statusCode == 200){
      return walls;
    }
    else {
      return [];
    }
  }

  static Future<List<dynamic>> searchWallpapers(String query)async {
    var baseUrl = "https://api.pexels.com/v1/search?query=$query&per_page=80";
    var headers = {
      'Authorization': '563492ad6f917000010000018afaccf5b3c942e3aa800733b7049524',
    };

    var result = await http.get(Uri.parse(baseUrl), headers: headers);
    var decodedResponse = jsonDecode(result.body);
    List walls = decodedResponse['photos'];

    if (result.statusCode == 200){
      return walls;
    }
    else {
      return [];
    }
  }
}