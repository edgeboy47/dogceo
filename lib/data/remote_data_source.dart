abstract class RemoteDataSource {
  Future<List<String>> getAllBreeds();

  Future<List<String>> getAllImagesForBreed(String slug);
}
