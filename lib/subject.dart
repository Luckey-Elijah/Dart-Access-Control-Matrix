part of 'access_control_matrix.dart';

class AcmSubject extends AcmObject {
  // ---- FIELDS ---- //

  int _id;

  /// The [Role] of the the [AcmSubject].
  Role role;

  // ---- CONSTRUCTORS ---- //

  AcmSubject(
    this.role,
    String name,
    List<String> data,
    List<int> executors,
    List<int> controllers,
    List<int> owners,
  ) : super(name, data, executors, controllers, owners) {
    _id = hashCode;
  }

  AcmSubject.duplicate(AcmSubject s)
      : super(s.name, s.data, s.executors, s.controllers, s.owners) {
    role = s.role;
    // name = subject.name;
    // data = subject.data;
    // executors = subject.executors;
    // controllers = subject.controllers;
    // owners = subject.owners;
    _id = hashCode;
  }

  /// Identifier of the the [AcmSubject]. Unique number is generted by [hashCode].
  int get id => _id;

  @override
  String toString() =>
      runtimeType.toString() +
      ': ' +
      {id, role, name, data, executors, controllers, owners}.toString();
}
