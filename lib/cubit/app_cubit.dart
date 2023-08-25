import 'package:employee_management/models/designation.dart';
import 'package:employee_management/models/status.dart';
import 'package:employee_management/services/database/local_database_adapter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:employee_management/models/employee.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.dart';
part 'app_cubit.freezed.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(this.databaseService)
      : super(const AppState(onDelete: false, isLoading: true));

  LocalDatabaseAdapter databaseService;

  void initialiseList() async {
    var currentEmployees = <Employee>[];
    var formerEmployees = <Employee>[];

    final employees = await databaseService.fetchActiveEmployees();

    for (final employee in (employees ?? <Employee>[])) {
      if (employee.endDate != null && employee.status != Status.deleted) {
        formerEmployees.add(employee!);
      }
      if (employee.endDate == null && employee.status != Status.deleted) {
        currentEmployees.add(employee!);
      }
    }

    return emit(
      state.copyWith(
        employees: employees ?? [],
        currentEmployees: currentEmployees,
        previousEmployees: formerEmployees,
        isLoading: false,
      ),
    );
  }

  void addEmployee({required Employee employee}) async {
    await databaseService.addEmployee(employee);
    final employees = await databaseService.fetchActiveEmployees();

    var currentEmployees = <Employee>[];
    var formerEmployees = <Employee>[];

    for (final employee in (employees ?? [])) {
      if (employee.endDate != null && employee.status != Status.deleted) {
        formerEmployees.add(employee!);
      }
      if (employee.endDate == null && employee.status != Status.deleted) {
        currentEmployees.add(employee!);
      }
    }

    return emit(
      state.copyWith(
        employees: employees ?? [],
        currentEmployees: currentEmployees,
        previousEmployees: formerEmployees,
      ),
    );
  }

  void deleteEmployee({required Employee employee}) async {
    await databaseService.updateEmployeeStatus(
      uuid: employee.uuid,
      status: Status.deleted,
    );

    final employees = await databaseService.fetchActiveEmployees();

    var currentEmployees = <Employee>[];
    var formerEmployees = <Employee>[];

    for (final employee in (employees ?? [])) {
      if (employee.endDate != null && employee.status != Status.deleted) {
        formerEmployees.add(employee!);
      }
      if (employee.endDate == null && employee.status != Status.deleted) {
        currentEmployees.add(employee!);
      }
    }
    return emit(
      state.copyWith(
        employees: employees ?? [],
        currentEmployees: currentEmployees,
        previousEmployees: formerEmployees,
        onDelete: true,
        lastDeletedUuid: employee.uuid,
      ),
    );
  }

  void undoDelete({required String uuid}) async {
    await databaseService.updateEmployeeStatus(
      uuid: uuid,
      status: Status.active,
    );

    final employees = await databaseService.fetchActiveEmployees();

    var currentEmployees = <Employee>[];
    var formerEmployees = <Employee>[];

    for (final employee in (employees ?? [])) {
      if (employee.endDate != null && employee.status != Status.deleted) {
        formerEmployees.add(employee!);
      }
      if (employee.endDate == null && employee.status != Status.deleted) {
        currentEmployees.add(employee!);
      }
    }

    return emit(
      state.copyWith(
        employees: employees ?? [],
        currentEmployees: currentEmployees,
        previousEmployees: formerEmployees,
      ),
    );
  }

  void editEmployee({
    required Employee employee,
    required String name,
    Status? status,
    required Designation designation,
    required DateTime startDate,
    required DateTime? endDate,
  }) async {
    final newEmployee = Employee()
      ..uuid = employee.uuid
      ..status = employee.status
      ..designation = designation
      ..name = name
      ..startDate = startDate
      ..endDate = endDate;

    await databaseService.updateEmployee(employee: newEmployee);

    final employees = await databaseService.fetchActiveEmployees();

    var currentEmployees = <Employee>[];
    var formerEmployees = <Employee>[];

    for (final employee in (employees ?? [])) {
      if (employee.endDate != null && employee.status != Status.deleted) {
        formerEmployees.add(employee!);
      }
      if (employee.endDate == null && employee.status != Status.deleted) {
        currentEmployees.add(employee!);
      }
    }

    return emit(
      state.copyWith(
        employees: employees ?? [],
        currentEmployees: currentEmployees,
        previousEmployees: formerEmployees,
      ),
    );
  }

  void resetDeleteFlag() => emit(state.copyWith(onDelete: false));
}
