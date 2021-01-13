import 'package:eval/data/network.dart';
import 'package:eval/utils/helper.dart';

import 'breed.dart';

class Repository {
  NetworkDataSource network;

  Repository(this.network);

  Future<List<Breed>> getAllBreeds() async {
    List<String> allBreedsList = await network.getAllBreeds();
    List<Breed> allBreeds = [];

    for (var breed in allBreedsList) {
      String title = breed;
      String slug = slugFromTitle(title);

      allBreeds.add(Breed(title, slug));
    }

    return allBreeds;
  }

  Future<List<String>> getAllImagesForBreed(Breed breed) async{
    return await network.getAllImagesForBreed(breed.slug);
  }
}
