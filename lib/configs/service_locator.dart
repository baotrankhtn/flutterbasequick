import '/data/app_repository.dart';

import '/data/local/pref_repository.dart';
import '/data/remote/api_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'flavors.dart';

final locator = GetIt.instance;

Future setupServiceLocator() async {
  // PrefRepository
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton<PrefRepository>(
      () => PrefRepository(sharedPreferences));

  // ApiService
  locator.registerLazySingleton<ApiService>(
      () => ApiService(appUrl: FlavorConfig.instance.values.appUrl));

  // AppRepository
  locator.registerLazySingleton<AppRepository>(() => AppRepository(
        apiService: locator.get(),
        prefRepository: locator.get(),
      ));
}
