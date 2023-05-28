import 'package:dio/dio.dart';
import 'package:aihunt/src/constant.dart';

final dio = Dio();

class ApiServices {
  Future<Map<String, dynamic>> getNews() async {
    var response =
        await dio.get("${Constants.apiUrl}=news&${Constants.pagination}");

    if (response.statusCode == 200) {
      return response.data;
    }

    return <String, dynamic>{};
  }

  Future<Map<String, dynamic>> getTools() async {
    var response = await dio.get(Constants.toolsUrl);

    if (response.statusCode == 200) {
      return response.data;
    }

    return <String, dynamic>{};
  }
}
