import 'package:dio/dio.dart';

class ApiHelper{
  ApiHelper._privateConstructor();

  final _dio = Dio(BaseOptions(baseUrl: 'https://dog.ceo/api'));

  static ApiHelper INSTANCE = new ApiHelper._privateConstructor();

  Future<dynamic> getData(String path) async{
    try {
      print('Full URL: ${_dio.options.baseUrl}/breeds/list/all');
      Response response = await _dio.get(path);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      throw Exception('Could not connect');
    }
  }
}