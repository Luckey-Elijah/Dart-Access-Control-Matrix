part of 'access_control_matrix.dart';

/// The database system has three types of users: [user], [securityOfficer],
/// [administrator].
enum Role {
  /// [Role.user]: Users who are allowed to perform only DML operations.
  user,

  /// [Role.securityOfficer]: Manges users and passwords. Also, they perform
  /// backup and recovery operations.
  securityOfficer,

  /// [Role.administrator]: Perform the tasks of all the above.
  administrator,
}

extension Stringify on Role {
  String string() {
    switch (this) {
      case Role.user:
        return 'USER';
      case Role.securityOfficer:
        return 'SECURITY OFFICER';
      case Role.administrator:
        return 'ADMINISTRATOR';
    }
    return '';
  }

  String acronym() {
    switch (this) {
      case Role.user:
        return 'U';
      case Role.securityOfficer:
        return 'O';
      case Role.administrator:
        return 'A';
    }
    return '';
  }
}
