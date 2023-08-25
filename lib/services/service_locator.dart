import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class ServiceLocator {
  static final GetIt instance = GetIt.instance;

  static void init() {
    instance.registerSingletonAsync<Isar>(() async {
      final dir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open(
        [],
        directory: dir.path,
      );
      return isar;
    });
  }
}
