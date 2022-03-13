import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiService extends ChangeNotifier {
  var baseURL = "https://jsonplaceholder.typicode.com";

  List<dynamic> listPosts = [];
  void getPostsData() async {
    try {
      var response = await Dio().get("$baseURL/posts");
      if (response.statusCode == 200) {
        listPosts.addAll(response.data);
        if (kDebugMode) {
          print("list data of Posts -> ${response.data}");
        }
      }
      notifyListeners();
    } catch (e) {
      throw Exception("error getPostData -->$e");
    }
  }
}
