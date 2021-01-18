import 'package:eval/domain/network.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

class MockNetworkDataSource extends Mock implements NetworkDataSource {}

void main() {
  MockNetworkDataSource mockNetwork;

  setUp(() {
    mockNetwork = MockNetworkDataSource();
  });
  group('Repository functions:', () {
    test('getAllBreeds()', () async {});

    test('getAllImagesForBreed()', () {});
  });
}
