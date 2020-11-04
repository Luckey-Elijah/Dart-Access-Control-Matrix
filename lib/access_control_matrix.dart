import 'dart:io';
part 'subject.dart';
part 'object.dart';
part 'roles.dart';

/// Managing the [AcmSubject]s and [AcmObject]s.
class AccessControlMatrix {
  // ---- FIELDS ---- //

  // Using private member to force usage of the getters and the methods below.
  final List<AcmObject> _objects = [];
  final List<AcmSubject> _subjects = [];

  // ---- GETTERS & SETTERS ---- //

  List<AcmObject> get objects => _objects;
  List<AcmSubject> get subjects => _subjects;

  // ---- METHODS ---- //

  void addObject(AcmObject object) => _objects.add(object);
  void addSubject(AcmSubject subject) => _subjects.add(subject);

  /// Removes the give [AcmObject]
  bool removeObject(AcmObject object) => _objects.remove(object);
  bool removeSubject(AcmSubject subject) => _subjects.remove(subject);

  void removeSubjectById(int id) => _subjects.removeWhere((s) => s.id == id);

  void addObjects(List<AcmObject> objects) => _objects.addAll(objects);
  void addSubjects(List<AcmSubject> subjects) => _subjects.addAll(subjects);

  void printUsers() {
    if (subjects.isEmpty) {
      stdout.writeln('There are no users.');
      return;
    }
    stdout.writeln('USERS:');
    subjects.forEach((subject) => stdout.writeln(subject));
  }

  void printAcm() {}
}
