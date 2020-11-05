import 'package:access_control_matrix/access_control_matrix.dart';

void main(List<String> arguments) {
  var acm = AccessControlMatrix();

  // Columns
  acm.addObjects([
    AcmObject('object-1', ['some', 'data'], [], [], []),
    AcmObject('Obj-2', ['some', 'data'], [], [], []),
    AcmObject('object-3', ['some', 'data'], [], [], []),
  ]);

  // Rows
  acm.addSubjects([
    AcmSubject(Role.user, 'user-1', ['data'], [], [], []),
    AcmSubject(Role.user, 'user-2', ['data'], [], [], []),
    AcmSubject(Role.securityOfficer, 'officer-1', ['data'], [], [], []),
    AcmSubject(Role.securityOfficer, 'Officer-02', ['data'], [], [], []),
    AcmSubject(Role.administrator, 'admin', ['data'], [], [], []),
  ]);

  acm.printAcm();
}
