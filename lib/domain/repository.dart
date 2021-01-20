import 'package:eval/data/local_data_source.dart';
import 'package:eval/data/remote_data_source.dart';
import 'package:eval/utils/helper.dart';

import 'package:eval/data/models/breed.dart';
import 'package:flutter/foundation.dart';

class Repository {
  RemoteDataSource remoteDataSource;
  LocalDataSource localCache;
  List<Breed> _localAllBreedsList;
  Map<String, List> _localImagesMap;

  Repository({@required this.remoteDataSource, @required this.localCache})
      : _localImagesMap = {};

  Future<List<Breed>> getAllBreeds() async {
    if (_localAllBreedsList == null) {
      List<String> allBreedsList = await remoteDataSource.getAllBreeds();
      List<Breed> allBreeds = [];

      for (String breed in allBreedsList) {
        String title = breed;
        String slug = slugFromTitle(title);

        allBreeds.add(Breed(title, slug));
      }

      _localAllBreedsList ??= allBreeds;
    }
    return _localAllBreedsList;
  }

  Future<List<String>> getAllImagesForBreed(Breed breed) async {
    _localImagesMap[breed.title] ??=
        await remoteDataSource.getAllImagesForBreed(breed.slug);

    return _localImagesMap[breed.title];
  }
}
