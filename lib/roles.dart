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
