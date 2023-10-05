import 'package:get_it/get_it.dart';
import 'package:product_management_ai_app/src/data/local_service/hive_service.dart';

final getIt = GetIt.instance;

setup() {
  // Services
  getIt.registerLazySingleton<HiveService>(() => HiveService());

  //view models
}
