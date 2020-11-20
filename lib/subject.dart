part of 'access_control_matrix.dart';

/// {@template subject}
/// An [AcmSubject] is an entity capable of accessing objects.
/// {@endtemplate}
class AcmSubject extends AcmObject {
  // ---- FIELDS ---- //

  int _id;

  /// The [Role] of the the [AcmSubject].
  Role role;

  // ---- CONSTRUCTORS ---- //

  /// {@macro subject}
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
    _id = hashCode;
  }

  /// Identifier of the the [AcmSubject]. Unique number is generted by [hashCode].
  int get id => _id;

  /// This subjects list of rights as provide by their [role].
  List<AccessRight> get accessRights {
    switch (role) {
      case Role.user:
        return [AccessRight.read, AccessRight.execute];
      case Role.securityOfficer:
        return [AccessRight.read, AccessRight.execute, AccessRight.write];
      case Role.administrator:
        return [
          AccessRight.read,
          AccessRight.execute,
          AccessRight.write,
          AccessRight.delete,
          AccessRight.create,
        ];
      default:
        return [];
    }
  }

  @override
  String toString() => '$id, $name, ${role.acronym()}, $data';

  @override
  String shorthand() => '$name, ${role.acronym()}';
}
