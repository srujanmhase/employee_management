import 'package:employee_management/models/designation.dart';
import 'package:employee_management/models/status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:employee_management/models/employee.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.dart';
part 'app_cubit.freezed.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState(onDelete: false));

  void initialiseList() {
    var employees = <Employee>[];
    var currentEmployees = <Employee>[];
    var formerEmployees = <Employee>[];

    for (int i = 0; i < 5; i++) {
      employees.add(
        Employee(
          uuid: i.toString(),
          status: Status.active,
          name: 'Srujan ${i.toString()}',
          designation: Designation.flutterDeveloper,
          startDate: DateTime.now(),
        ),
      );
    }

    for (int i = 0; i < 5; i++) {
      employees.add(
        Employee(
          uuid: {i + 5}.toString(),
          status: Status.active,
          name: 'Srujan ${(i + 5).toString()}',
          designation: Designation.flutterDeveloper,
          startDate: DateTime.now(),
          endDate: DateTime.now(),
        ),
      );
    }

    for (final employee in employees) {
      if (employee.endDate != null && employee.status != Status.deleted) {
        formerEmployees.add(employee);
      }
      if (employee.endDate == null && employee.status != Status.deleted) {
        currentEmployees.add(employee);
      }
    }

    return emit(
      state.copyWith(
        employees: employees,
        currentEmployees: currentEmployees,
        previousEmployees: formerEmployees,
      ),
    );
  }

  void addEmployee({required Employee employee}) {
    var employees = List.of(state.employees);
    var currentEmployees = List.of(state.currentEmployees);
    var formerEmployees = List.of(state.previousEmployees);

    employees.add(employee);

    if (employee.endDate != null) {
      formerEmployees.add(employee);
    }

    if (employee.endDate == null) {
      currentEmployees.add(employee);
    }

    return emit(
      state.copyWith(
        employees: employees,
        currentEmployees: currentEmployees,
        previousEmployees: formerEmployees,
      ),
    );
  }

  void deleteEmployee({required Employee employee}) {
    var employees = List.of(state.employees);
    var currentEmployees = List.of(state.currentEmployees);
    var formerEmployees = List.of(state.previousEmployees);

    if (employee.endDate != null) {
      formerEmployees.removeWhere((element) => element == employee);
    }

    if (employee.endDate == null) {
      currentEmployees.removeWhere((element) => element == employee);
    }

    final updatedEmployee = employees
        .where(
          (element) => element == employee,
        )
        .first
        .copyWith(
          status: Status.deleted,
        );

    employees.removeWhere(
      (element) => element == employee,
    );
    employees.add(updatedEmployee);

    return emit(
      state.copyWith(
        employees: employees,
        currentEmployees: currentEmployees,
        previousEmployees: formerEmployees,
        onDelete: true,
        lastDeletedUuid: employee.uuid,
      ),
    );
  }

  void undoDelete({required String uuid}) {
    var employees = List.of(state.employees);
    var currentEmployees = List.of(state.currentEmployees);
    var formerEmployees = List.of(state.previousEmployees);

    final updatedEmployee = employees
        .where(
          (element) => element.uuid == uuid,
        )
        .first
        .copyWith(
          status: Status.active,
        );

    employees.removeWhere(
      (element) => element.uuid == uuid,
    );
    employees.add(updatedEmployee);

    if (updatedEmployee.endDate != null) {
      formerEmployees.add(updatedEmployee);
    }
    if (updatedEmployee.endDate == null) {
      currentEmployees.add(updatedEmployee);
    }

    return emit(
      state.copyWith(
        employees: employees,
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
  }) {
    var employees = List.of(state.employees);
    var currentEmployees = List.of(state.currentEmployees);
    var formerEmployees = List.of(state.previousEmployees);

    var selectedEmployee = employees
        .where(
          (element) => element.uuid == employee.uuid,
        )
        .first;

    final updatedEmployee = selectedEmployee.copyWith(
      name: name,
      designation: designation,
      startDate: startDate,
      endDate: endDate,
    );

    employees.removeWhere(
      (element) => element.uuid == employee.uuid,
    );
    employees.add(updatedEmployee);

    if (employee.endDate != null) {
      formerEmployees.removeWhere((element) => element.uuid == employee.uuid);
    }

    if (employee.endDate == null) {
      currentEmployees.removeWhere((element) => element.uuid == employee.uuid);
    }

    if (updatedEmployee.endDate != null) {
      formerEmployees.add(updatedEmployee);
    }
    if (updatedEmployee.endDate == null) {
      currentEmployees.add(updatedEmployee);
    }

    return emit(
      state.copyWith(
        employees: employees,
        currentEmployees: currentEmployees,
        previousEmployees: formerEmployees,
      ),
    );
  }

  void resetDeleteFlag() => emit(state.copyWith(onDelete: false));
}
