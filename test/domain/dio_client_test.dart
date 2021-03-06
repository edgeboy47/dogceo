import 'package:dio/dio.dart';
import 'package:eval/domain/dio_client.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  DioClient network;
  const TOTAL_BREEDS = 141;
  const TOTAL_AFGHAN_HOUND_IMAGES = 239;

  setUp(() {
    network = DioClient(client: Dio());
  });

  group('Testing Network functions:', () {
    test('getAllBreeds()', () async {
      expect((await network.getAllBreeds()).length, TOTAL_BREEDS);
    });
  });

  test('Correct breeds', () async {
    expect((await network.getAllBreeds())[1], 'African');
  });

  test('getAllImagesForBreed()', () async {
    expect((await network.getAllImagesForBreed('hound/afghan')).length,
        TOTAL_AFGHAN_HOUND_IMAGES);
  });
}
