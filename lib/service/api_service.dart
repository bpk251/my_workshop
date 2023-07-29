import 'package:dio/dio.dart';

class ApiService {
  final dio = Dio(BaseOptions(baseUrl: "https://flutter-demo-2023.amiearth.com/"));

  dynamic callGetMothod(String path) async {
    Response response;
    response = await dio.get(path);
    if (response.statusCode == 200 && response.data['status'] == "success") {
      return response.data['data'];
    }
    return null;
  }

  dynamic callPostMothod(
    String path, {
    Map<String, dynamic>? body,
  }) async {
    Response response;
    response = await dio.post(path, data: body);
    if (response.statusCode == 200 && response.data['status'] == "success") {
      return response.data['data'];
    }
    return null;
  }

  dynamic callPutMothod(
    String path, {
    Map<String, dynamic>? body,
  }) async {
    Response response;
    response = await dio.put(path, data: body);
    if (response.statusCode == 200 && response.data['status'] == "success") {
      return response.data['data'];
    }
    return null;
  }

  dynamic callDeleteMothod(String path) async {
    Response response;
    response = await dio.delete(path);
    if (response.statusCode == 200 && response.data['status'] == "success") {
      return response.data['data'];
    }
    return null;
  }
}
