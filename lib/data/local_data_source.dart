abstract class LocalDataSource {
  Future<List<String>> getAllBreeds();

  Future<void> saveListOfBreeds(List<String> list);

  Future<List<String>> getAllImagesForBreed(String breed);

  Future<void> saveListOfImagesForBreed(String breed, List<String> list);

  Future<void> saveImageToDevice(String imagePath);
}
