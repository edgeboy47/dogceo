import 'package:dio/dio.dart';
import 'package:eval/data/remote_data_source.dart';
import 'package:eval/utils/helper.dart';
import 'package:flutter/foundation.dart';

class DioClient extends RemoteDataSource {
  String allBreedsURL = "https://dog.ceo/api/breeds/list/all";
  Dio client;
  
  DioClient({@required this.client});

  Future<List<String>> getAllBreeds() async {
    List<String> breeds = [];
    try {
      final response = await client.get(allBreedsURL);
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
      final response = await client.get(url);
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
