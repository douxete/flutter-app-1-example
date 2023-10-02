import 'package:flutter_api/data/repository/dog_repository.dart';

class DogViewModel{
  DogRepository _dogRepository = DogRepository();

  List<String> breeds = [];

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  Future<List<dynamic>> getDog()async{
    final getDogList = await _dogRepository.getDogs();
    var message = getDogList['message'];
    if (message is Map) {
      var breeds = message.keys.toList();
      for (var i = 0; i < breeds.length; i++) {
        breeds[i] = capitalize(breeds[i]);
      }
      return breeds;
    }
    return [];
  }
}