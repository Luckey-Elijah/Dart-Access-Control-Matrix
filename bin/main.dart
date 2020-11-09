import 'dart:io';
import 'package:access_control_matrix/access_control_matrix.dart';

const usage = '''
\n0. EXIT
1. Show ACM
2. Show users
3. Add user
4. Delete User
5. User database ('CREATE' and 'DROP' supported)
6. Change user's role.
''';

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

  // acm.printAcm();
  // acm.printUsers();

  var timeToExit = false;
  stdout.writeln('\n👋 Welcome! Pick an option to continue or exit.');

  // Main driver code here for interactive code
  while (!timeToExit) {
    stdout.writeln(usage);

    stdout.write('\n[OPTION]:');
    var option = stdin.readLineSync();

    // Start evaluating cases.
    switch (int.tryParse(option)) {
      // EXIT the program
      case 0:
        stdout.writeln('See ya! 👋');
        timeToExit = true;
        break;

      // Print the ACM matrix
      case 1:
        stdout.write('\n');
        acm.printAcm();
        break;

      // Print the users.
      case 2:
        acm.printUsers();
        break;

      // The user didn't provide a good option.
      default:
        stdout.writeln('😠 Incorrect option!');
        break;
    }
  }
}
