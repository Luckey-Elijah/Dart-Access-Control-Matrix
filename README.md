# Access Control Matrix

A simple Dart-implemented ACM.

## Design

This section describes the designs and API of this program. All API documents can be found on [its GitHub Pages](https://luckey-elijah.github.io/Dart-Access-Control-Matrix/access_control_matrix/access_control_matrix-library.html).

### [`Roles`](./lib/roles.dart)

The database system has three types of users: `user`, `securityOfficer`, `administrator`.

- `user`: Users who are allowed to perform only DML operations.
- `securityOfficer`: Manges users and passwords. Also, they perform backup and recovery operations.
- `administrator`: Perform the tasks of all the above.

### [`AcmObject`](./lib/object.dart) and [`AcmSubject`](./lib/subject.dart)

The `AcmSubject` class inherits all of the methods and fields of the `AcmObject` class. There are two fields that are added the `AcmSubject` class to differentiate it: `id` and `role` (*described later*).

### [`AccessControlMatrix`](./lib/access_control_matrix.dart)

The `AccessControlMatrix` class is used to control and manage the `AcmSubject`s and `AcmObject`s.
