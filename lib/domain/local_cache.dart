import 'package:eval/data/local_data_source.dart';

class LocalCache extends LocalDataSource {

  @override
  Future<List<String>> getAllBreeds() {
    // TODO: implement getAllBreeds
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getAllImagesForBreed(String breed) {
    // TODO: implement getAllImagesForBreed
    throw UnimplementedError();
  }

  @override
  Future<void> saveImageToDevice(String imagePath) {
    // TODO: implement saveImageToDevice
    throw UnimplementedError();
  }

  @override
  Future<void> saveListOfBreeds(List<String> list) {
    // TODO: implement saveListOfBreeds
    throw UnimplementedError();
  }

  @override
  Future<void> saveListOfImagesForBreed(String breed, List<String> list) {
    // TODO: implement saveListOfImagesForBreed
    throw UnimplementedError();
  }
}
