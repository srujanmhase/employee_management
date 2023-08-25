import 'package:employee_management/models/employee.dart';
import 'package:employee_management/models/status.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class LocalDatabaseAdapter {
  static Isar? _isar;

  Future<void> initIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [EmployeeSchema],
      directory: dir.path,
    );
  }

  Future<List<Employee>?> fetchActiveEmployees() async {
    if (_isar == null) await initIsar();
    final employees =
        await _isar?.employees.filter().statusEqualTo(Status.active).findAll();
    return employees;
  }

  Future<void> addEmployee(Employee employee) async {
    if (_isar == null) await initIsar();
    await _isar?.writeTxn(() async {
      await _isar?.employees.put(employee);
    });
  }

  Future<void> updateEmployeeStatus({
    required String uuid,
    required Status status,
  }) async {
    if (_isar == null) await initIsar();
    await _isar?.writeTxn(() async {
      final oldE =
          await _isar?.employees.filter().uuidEqualTo(uuid).findFirst();
      if (oldE == null) return;
      oldE.status = status;
      await _isar?.employees.put(oldE);
    });
  }

  Future<void> updateEmployee({
    required Employee employee,
  }) async {
    if (_isar == null) await initIsar();
    await _isar?.writeTxn(() async {
      final oldE = await _isar?.employees
          .filter()
          .uuidEqualTo(employee.uuid)
          .findFirst();
      if (oldE == null) return;
      oldE.status = employee.status;
      oldE.designation = employee.designation;
      oldE.name = employee.name;
      oldE.startDate = employee.startDate;
      oldE.endDate = employee.endDate;
      await _isar?.employees.put(oldE);
    });
  }
}
