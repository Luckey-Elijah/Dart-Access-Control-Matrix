import 'package:access_control_matrix/access_control_matrix.dart'
    show Role, Stringify;
import 'package:test/test.dart';

void main() {
  group('Roles print string should be human-readable.', () {
    test('User role string', () {
      final user = Role.user;
      expect(user.string(), 'USER');
    });
    test('Securtiy officer role string', () {
      final officer = Role.securityOfficer;
      expect(officer.string(), 'SECURITY OFFICER');
    });
    test('Administrator role string', () {
      final admin = Role.administrator;
      expect(admin.string(), 'ADMINISTRATOR');
    });
  });

  group('Roles print acronym should be one letter', () {
    test('User role acronym', () {
      final user = Role.user;
      expect(user.acronym(), 'U');
    });
    test('Security officer role acronym', () {
      final officer = Role.securityOfficer;
      expect(officer.acronym(), 'O');
    });
    test('Administrator role acronym', () {
      final admin = Role.administrator;
      expect(admin.acronym(), 'A');
    });
  });
}
