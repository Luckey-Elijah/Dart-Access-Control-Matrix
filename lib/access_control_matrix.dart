import 'dart:io';

import 'dart:math';
part 'subject.dart';
part 'object.dart';
part 'roles.dart';
part 'const.dart';

/// Managing the [AcmSubject]s and [AcmObject]s.
class AccessControlMatrix {
  // ---- FIELDS ---- //

  // Using private member to force usage of the getters and the methods below.
  final List<AcmObject> _objects = [];
  final List<AcmSubject> _subjects = [];

  // ---- GETTERS & SETTERS ---- //

  List<AcmObject> get objects => _objects;
  List<AcmSubject> get subjects => _subjects;

  // ---- CONSTRUCTOR ---- //

  // These constructors build a SINGLETON object - all, referencing back to the same instance.
  AccessControlMatrix._();

  factory AccessControlMatrix() => _acm;

  static final AccessControlMatrix _acm = AccessControlMatrix._();

  // ---- METHODS ---- //

  void addObject(AcmObject object) => _objects.add(object);
  void addSubject(AcmSubject subject) => _subjects.add(subject);

  /// Removes the given [AcmObject]. Returns true if succesful;
  /// otherwise, false.
  bool removeObject(AcmObject object) => _objects.remove(object);

  /// Removes the given [AcmSubject]. Returns true if succesful;
  /// otherwise, false.
  bool removeSubject(AcmSubject subject) => _subjects.remove(subject);

  /// Attempts to remove subject by the given [id].
  void removeSubjectById(int id) => _subjects.removeWhere((s) => s.id == id);

  /// Adds to the list of [AcmObject]s in bulk.
  void addObjects(List<AcmObject> objects) {
    if (objects == null) return;
    _objects.addAll(objects);
  }

  /// Adds to the list of [AcmSubject]s in bulk.
  void addSubjects(List<AcmSubject> subjects) {
    if (objects == null) return;
    _subjects.addAll(subjects);
  }

  /// Prints the users/subjects stored in the acm. Returns true if there are
  /// users; otherwise, false.
  bool printUsers() {
    if (subjects.isEmpty) {
      stdout.writeln('There are no users.');
      return false;
    }
    stdout.writeln('USERS:');
    subjects.forEach((subject) => stdout.writeln(subject));
    return true;
  }

  /// Prints the access control matrix in a human-understandable format.
  ///
  /// ```text
  ///┌──────────┬──────────┬──────────┬──────────┐
  ///│   ACM    │  obj-1   │  Obj-2   │  obj-3   │
  ///├──────────┼──────────┼──────────┼──────────┤
  ///│  us-1, U │   -xw    │   r--    │   -xw    │
  ///├──────────┼──────────┼──────────┼──────────┤
  ///│  us-2, U │   rxw    │   --w    │   r--    │
  ///├──────────┼──────────┼──────────┼──────────┤
  ///│   o-1, O │   -x-    │   -xw    │   --w    │
  ///├──────────┼──────────┼──────────┼──────────┤
  ///│ Of-02, O │   r-w    │   rxw    │   rx-    │
  ///├──────────┼──────────┼──────────┼──────────┤
  ///│ admin, A │   r-w    │   --w    │   rxw    │
  ///└──────────┴──────────┴──────────┴──────────┘
  /// ```
  void printAcm() {
    if (objects.isEmpty && subjects.isEmpty) {
      stdout.writeln('The matrix is empty');
    }

    var rows = subjects.length + 1;
    var cols = objects.length + 1;

    var matrix = List.generate(rows, (_) => List<String>(cols));

    var width = 3; // Starts with 3 since 'ACM' is "widest"

    // Iterate over rows
    for (var r = 0; r < rows; r++) {
      // Iterate over columns
      for (var c = 0; c < cols; c++) {
        // This is the first square
        if (r == 0 && c == 0) {
          matrix[0][0] = 'ACM';
        }

        // We know that r_0 is dealing with objects (top row)
        if (r == 0 && c > 0) {
          var o = objects[c - 1].shorthand();
          matrix[0][c] = o;
          if (o.length > width) width = o.length;
        }

        // We know that c_0 is dealing with subjects (left column)
        if (r > 0 && c == 0) {
          var s = subjects[r - 1].shorthand();
          matrix[r][0] = s;
          if (s.length > width) width = s.length;
        }

        if (r > 0 && c > 0) {
          // TODO: complete the cell data.
          // Currently generating random information in the cell
          var options = ['rxw', 'rx-', 'r-w', 'r--', '-xw', '-x-', '--w'];
          matrix[r][c] = options[Random().nextInt(options.length)];

          if (matrix[r][c].length > width) width = matrix[r][c].length;
        }
      }
    }

    // Handles actual printing

    width = width + 2; // addds padding
    var hline = (Runes.horizontalLine * width);

    for (var r = 0; r < rows; r++) {
      var line = '';
      var rowString = '';

      // TOP LINE
      if (r == 0) {
        line = Runes.cornerTopLeft +
            (hline + Runes.wallTop) * (objects.length) +
            hline +
            Runes.cornerTopRight;
        stdout.writeln(line);
      }

      for (var c = 0; c < cols; c++) {
        var pSize = width - (matrix[r][c] == null ? 0 : matrix[r][c].length);
        var lPad = (r > 0 && c == 0) ? pSize - 1 : (pSize ~/ 2);
        var rPad = pSize - lPad;

        rowString = rowString +
            Runes.verticalLine +
            (' ' * lPad) +
            (matrix[r][c] ?? '') +
            (' ' * rPad);
      }

      line = Runes.wallLeft +
          (hline + Runes.cross) * (cols - 1) +
          hline +
          Runes.wallRight;
      stdout.writeln(rowString + Runes.verticalLine);

      // BOTTOM LINE
      if (r == rows - 1) {
        line = Runes.cornerBotLeft +
            ((hline + Runes.wallBot) * (cols - 1)) +
            (hline + Runes.cornerBotRight);
        // break;
      }
      stdout.writeln(line);
    }
  }
}
