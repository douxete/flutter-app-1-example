import 'package:flutter_api/data/api/api_helper.dart';
import 'package:flutter_api/data/model/dog.dart';

class DogRepository{
  final ApiHelper _apiHelper = ApiHelper.INSTANCE;
  List<dynamic> breeds = [];

  Future<Map<String, dynamic>> getDogs()async{
    final response = await _apiHelper.getData('/breeds/list/all');
    return response;
  }
}