import 'package:employee_management/models/designation.dart';
import 'package:employee_management/models/status.dart';

import 'package:isar/isar.dart';

// part 'employee.freezed.dart';

// @Freezed()
// class Employee with _$Employee {
//   const factory Employee({
//     required String uuid,
//     required Status status,
//     required String name,
//     required Designation designation,
//     required DateTime startDate,
//     DateTime? endDate,
//   }) = _Employee;
// }

part 'employee.g.dart';

@collection
class Employee {
  Id id = Isar.autoIncrement;

  @Index()
  late String uuid;

  @Enumerated(EnumType.name)
  Designation? designation;

  @Enumerated(EnumType.name)
  Status? status;

  String? name;

  DateTime? startDate;

  DateTime? endDate;
}
