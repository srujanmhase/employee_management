import 'package:employee_management/models/designation.dart';
import 'package:employee_management/models/status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee.freezed.dart';

@Freezed()
class Employee with _$Employee {
  const factory Employee({
    required String uuid,
    required Status status,
    required String name,
    required Designation designation,
    required DateTime startDate,
    DateTime? endDate,
  }) = _Employee;
}
