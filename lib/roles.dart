/// The database system has three types of users: [user], [securityOfficer],
/// [administrator].
///
/// [Role.user]: Users who are allowed to perform only DML operations.
///
/// [Role.securityOfficer]: Manges users and passwords. Also, they perform
/// backup and recovery operations.
///
/// [Role.administrator]: Perform the tasks of all the above.
enum Role { user, securityOfficer, administrator }
