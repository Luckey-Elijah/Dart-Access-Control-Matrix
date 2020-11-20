# Access Control Matrix

A simple Dart-implemented ACM.

## Usage

Must have [Dart SDK](https://dart.dev/get-dart) installed.

```bash
dart bin/main.dart
```

Expected prompt:
```
👋 Welcome! Pick an option to continue or exit.

0. EXIT
1. Show ACM
2. Show users
3. Add user
4. Delete User
5. User database ('CREATE' and 'DROP' supported)
6. Change user's role.
```

## Design

This section describes the designs and API of this program. All API documents can be found on [its GitHub Pages](https://luckey-elijah.github.io/Dart-Access-Control-Matrix/access_control_matrix/access_control_matrix-library.html).

### [`Role`](./lib/roles.dart)

The database system has three types of users: `user`, `securityOfficer`, `administrator`.

- `user`: Users who are allowed to perform only DML operations.
- `securityOfficer`: Manges users and passwords. Also, they perform backup and recovery operations.
- `administrator`: Perform the tasks of all the above.

### [`AcmObject`](./lib/object.dart) and [`AcmSubject`](./lib/subject.dart)

The `AcmSubject` class inherits all of the methods and fields of the `AcmObject` class. There are two fields that are added the `AcmSubject` class to differentiate it: `id` and `role`.

### [`AccessControlMatrix`](./lib/access_control_matrix.dart)

The `AccessControlMatrix` class is used to control and manage the `AcmSubject`s and `AcmObject`s.
