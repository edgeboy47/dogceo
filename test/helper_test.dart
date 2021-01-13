import 'package:eval/utils/helper.dart';
import 'package:test/test.dart';

void main() {
  group('Helper functions:', () {
    test('capitalize', () {
      expect(capitalize('abcd'), 'Abcd');
    });

    test('slugFromTitle', () {
      expect(slugFromTitle('Afghan Hound'), 'hound/afghan');
    });
  });
}
