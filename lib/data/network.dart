import 'package:dio/dio.dart';
import 'package:eval/utils/helper.dart';

class NetworkDataSource {
  String allBreedsURL = "https://dog.ceo/api/breeds/list/all";

  Future<List<String>> getAllBreeds() async {
    List<String> breeds = [];
    try {
      final response = await Dio().get(allBreedsURL);
      if (response.statusCode == 200 && response.data['status'] == "success") {
        Map<String, dynamic> message = response.data['message'];

        for (var key in message.keys) {
          String breed = capitalize(key);
          List subBreeds = message[key];

          if (subBreeds.length > 0) {
            subBreeds.forEach((el) {
              String fullBreedName = '${capitalize(el)} $breed';
              breeds.add(fullBreedName);
            });
          } else
            breeds.add(breed);
        }
      }
    } catch (e) {
      print(e);
      rethrow;
    }
    return breeds;
  }

  Future<List<String>> getAllImagesForBreed(String slug) async {
    String url = 'https://dog.ceo/api/breed/$slug/images';
    List<String> imageURLs = [];

    try {
      final response = await Dio().get(url);
      if (response.statusCode == 200 && response.data['status'] == "success") {
        Map<String, dynamic> data = response.data;
        imageURLs = List.from(data['message']).cast<String>();
      }
    } catch (e) {
      print(e);
      rethrow;
    }

    return imageURLs;
  }
}
