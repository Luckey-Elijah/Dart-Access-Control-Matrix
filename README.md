# Access Control Matrix

A simple Dart-implemented ACM.

## Design

This section describes the designs and API of this program.

### [`Roles`](./lib/roles.dart)

The database system has three types of users: `user`, `securityOfficer`, `administrator`.

- `user`: Users who are allowed to perform only DML operations.
- `securityOfficer`: Manges users and passwords. Also, they perform backup and recovery operations.
- `administrator`: Perform the tasks of all the above.

### [`Object`](./lib/object.dart) and [`Subject`](./lib/subject.dart)

The `Subject` class inherits all of the methods and fields of the `Object` class. There are two fields that are added the `Subject` class to differentiate it: `id` and `role` (*described later*).

### [`AccessControlMatrix`](./lib/access_control_matrix.dart)

The `AccessControlMatrix` class is used to control and manage the `Subject`s and `Object`s.
