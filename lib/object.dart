part of 'access_control_matrix.dart';

class AcmObject {
  // ---- FIELDS ---- //

  /// The name of the object.
  String name;

  /// The content/data of the object.
  List<String> data = [];

  /// List of [AcmSubject.id]s of the subjects that can execute the object.
  List<int> executors = [];

  /// List of [AcmSubject.id]s of the subjects that control the object.
  List<int> controllers = [];

  /// List of [AcmSubject.id]s of the subjects that own the object.
  List<int> owners = [];

  // ---- CONSTRUCTORS ---- //

  AcmObject(
      this.name, this.data, this.executors, this.controllers, this.owners);

  /// Duplicates an [AcmObject], name required.
  AcmObject.duplicate(AcmObject object) {
    name = object.name;
    data = object.data;
    executors = object.executors;
    controllers = object.controllers;
    owners = object.owners;
  }

  // ---- METHODS ---- //

  /// Removes the given [AcmSubject.id] from [owners] list. Returns [true]
  /// if success, [false] otherwise.
  bool removeOwner(int id) => owners.remove(id);

  /// Removes the given [AcmSubject.id] from [controllers] list. Returns [true]
  /// if success, [false] otherwise.
  bool removeController(int id) => controllers.remove(id);

  /// Removes the given [AcmSubject.id] from [controllers] list. Returns [true]
  /// if success, [false] otherwise.
  bool removeExecutor(int id) => executors.remove(id);

  /// Adds the [id] to the appropiate list ([owners], [controllers],
  /// [executors]) based on the given [authority]. Returns [true] if success,
  /// [false] otherwise.
  bool authenticate(int id, Role authority) {
    switch (authority) {
      case Role.user:
        executors.add(id);
        return true;

      case Role.securityOfficer:
        controllers.add(id);
        return true;

      case Role.administrator:
        owners.add(id);
        return true;
    }
    return false;
  }

  @override
  String toString() => '''
Subject:      $name
data:         $data
executors:    $executors
controllers:  $controllers
owners:       $owners
''';
}
