import 'roles.dart';

class Object {
  // ---- FIELDS ---- //

  /// The name of the object.
  String name;

  /// The content/data of the object.
  List<String> data = [];

  /// List of [Subject.id]s of the subjects that can execute the object.
  List<int> executors = [];

  /// List of [Subject.id]s of the subjects that control the object.
  List<int> controllers = [];

  /// List of [Subject.id]s of the subjects that own the object.
  List<int> owners = [];

  // ---- METHODS ---- //

  /// Removes the given [Subject.id] from [owners] list. Returns [true]
  /// if success, [false] otherwise.
  bool removeOwner(int id) => owners.remove(id);

  /// Removes the given [Subject.id] from [controllers] list. Returns [true]
  /// if success, [false] otherwise.
  bool removeController(int id) => controllers.remove(id);

  /// Removes the given [Subject.id] from [controllers] list. Returns [true]
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
}
