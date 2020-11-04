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
    var string;
    switch (this) {
      case Role.user:
        string = 'USER';
        break;
      case Role.securityOfficer:
        string = 'SECURITY OFFICER';
        break;
      case Role.administrator:
        string = 'ADMINISTRATOR';
        break;
    }
    return string;
  }
}
