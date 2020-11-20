import 'package:access_control_matrix/access_control_matrix.dart'
    show AccessControlMatrix;
import 'package:test/test.dart';

void main() {
  group('Access Control Matrix', () {
    test('AccessControlMatrix creates a singleton', () {
      var acm1 = AccessControlMatrix();
      var acm2 = AccessControlMatrix();
      expect(identical(acm1, acm2), true);
    });
  });
}
