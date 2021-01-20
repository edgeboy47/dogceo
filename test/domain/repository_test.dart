import 'package:eval/domain/dio_client.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

class MockDioClient extends Mock implements DioClient {}

void main() {
  MockDioClient mockNetwork;

  setUp(() {
    mockNetwork = MockDioClient();
  });
  group('Repository functions:', () {
    test('getAllBreeds()', () async {});

    test('getAllImagesForBreed()', () {});
  });
}
