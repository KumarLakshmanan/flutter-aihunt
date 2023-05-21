import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:todoapp/src/constant.dart';

final dio = Dio();

class ApiServices {
  Future<Map<String, dynamic>> getNews() async {
    var response =
        await dio.get("${Constants.baseUrl}=news&${Constants.pagination}");

    debugPrint("${Constants.baseUrl}=news&${Constants.pagination}");

    if (response.statusCode == 200) {
      return response.data;
    }

    return <String, dynamic>{};
  }
}
