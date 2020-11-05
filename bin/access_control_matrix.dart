import 'package:access_control_matrix/access_control_matrix.dart';

void main(List<String> arguments) {
  var acm = AccessControlMatrix();

  // Columns
  acm.addObjects([
    AcmObject('obj-1', ['some', 'data'], [], [], []),
    AcmObject('Obj-2', ['some', 'data'], [], [], []),
    AcmObject('obj-3', ['some', 'data'], [], [], []),
  ]);

  // Rows
  acm.addSubjects([
    AcmSubject(Role.user, 'us-1', ['data'], [], [], []),
    AcmSubject(Role.user, 'us-2', ['data'], [], [], []),
    AcmSubject(Role.securityOfficer, 'o-1', ['data'], [], [], []),
    AcmSubject(Role.securityOfficer, 'Of-02', ['data'], [], [], []),
    AcmSubject(Role.administrator, 'admin', ['data'], [], [], []),
  ]);

  acm.printAcm();
}
