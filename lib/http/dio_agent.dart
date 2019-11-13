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

///火爆商品
Future<String> getPageBelowContent(int index) async {
  try {
    Dio dio = Dio();
    dio.options.contentType = "application/x-www-form-urlencoded";

    var formData = {'page': '$index'};
    //queryParameters这个参数表示添加请求头
    Response response =
    await dio.post(servicePath['homePageBelowConten'], data: formData);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('接口异常');
    }
  } catch (e) {
    print(e);
  }
}


///分类
Future<String> getCategory() async {
  try {
    Dio dio = Dio();
    dio.options.contentType = "application/x-www-form-urlencoded";

    //queryParameters这个参数表示添加请求头
    Response response =
    await dio.post(servicePath['getCategory']);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('接口异常');
    }
  } catch (e) {
    print(e);
  }
}



///分类内容
Future<String> getCategoryContent(String categoryId,String categorySubId,int page) async {
  try {
    Dio dio = Dio();
    dio.options.contentType = "application/x-www-form-urlencoded";
    var data={
      'categoryId':categoryId,
      'categorySubId':categorySubId,
      'page':page
    };
    //queryParameters这个参数表示添加请求头
    Response response =
    await dio.post(servicePath['getMallGoods'],data: data);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('接口异常');
    }
  } catch (e) {
    print(e);
  }
}


///详情
Future<String> getGoodInfo(String goodId) async {
  try {
    Dio dio = Dio();
    dio.options.contentType = "application/x-www-form-urlencoded";
    var data={
      'goodId':goodId,
    };
    //queryParameters这个参数表示添加请求头
    Response response =
    await dio.post(servicePath['getGoodDetailById'],data: data);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('接口异常');
    }
  } catch (e) {
    print(e);
  }
}
