/// An [AccessRight] describes the way in which a [AcmSubject] may access
/// an [AcmObject].
enum AccessRight {
  /// [Role] may view information in a system resource (e.g., a file, selected
  /// records in a file, selected fields within a record, or some combination).
  /// Read access includes the ability to copy or print.
  /// Represented as `R`.
  read,

  /// [Role] may add, modify, or delete data in system resource (e.g., files,
  /// records, programs). Write access includes read access.
  /// Represented as `W`.
  write,

  /// [Role] may execute specified programs.
  /// Represented as `E`.
  execute,

  /// [Role] may delete certain system resources, such as files or records.
  /// Represented as `D`.
  delete,

  /// [Role] may create new files, records, or fields.
  /// Represented as `C`.
  create,
}

extension on AccessRight {
  String string() {
    switch (this) {
      case AccessRight.read:
        return 'READ';
      case AccessRight.write:
        return 'WRITE';
      case AccessRight.execute:
        return 'EXECUTE';
      case AccessRight.delete:
        return 'DELETE';
      case AccessRight.create:
        return 'CREATE';
    }
    return '';
  }

  String acronym() {
    switch (this) {
      case AccessRight.read:
        return 'R';
      case AccessRight.write:
        return 'W';
      case AccessRight.execute:
        return 'X';
      case AccessRight.delete:
        return 'D';
      case AccessRight.create:
        return 'C';
    }
    return '';
  }
}
