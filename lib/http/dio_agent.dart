import 'package:dio/dio.dart';
import 'package:flutter_app/http/urls.dart';

///首页接口
Future<String> getHomeContent() async {
  try {
    Dio dio = Dio();
    dio.options.contentType = "application/x-www-form-urlencoded";

    var formData = {'lon': '115.02932', 'lat': '35.76189'};
    //queryParameters这个参数表示添加请求头
    Response response =
        await dio.post(servicePath['homePagecontent'], data: formData);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('接口异常');
    }
  } catch (e) {
    print(e);
  }
}
