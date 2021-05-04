import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:wallpaper_api/model/imagemodel.dart';
import 'package:http/http.dart' as http;

const apiKey = "21415111-8fe06e6373840d8e2c66e0deb";

Future<ImageModel> getData(String query, String color, bool ec) async {
  try {
    Response response =
        await Dio().get('https://pixabay.com/api/', queryParameters: {
      "key": apiKey,
      "q": query,
      "colors": color,
      "page": 1,
      "per_page": 20,
      "editors_choice": ec,
      "image_type": "photo",
      //"orientation": "vertical",
     
    });

    print(response.data);
    return ImageModel.fromJson(response.data);
  } catch (e) {
    print(e);
  }
}
