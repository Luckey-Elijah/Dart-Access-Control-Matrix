import 'package:access_control_matrix/access_control_matrix.dart';

void main(List<String> arguments) {
  var acm = AccessControlMatrix();

  acm.addSubjects([
    AcmSubject(Role.administrator, 'user1', ['data'], [], [], []),
    AcmSubject(Role.administrator, 'user2', ['data'], [], [], []),
  ]);

  acm.printUsers();
}
