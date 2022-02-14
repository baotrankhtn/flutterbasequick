import 'package:flutterbasequick/data/local/pref_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future setupServiceLocator() async {
  // PrefRepository
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton<PrefRepository>(
      () => PrefRepository(sharedPreferences));

  // ApiService
  // locator.registerLazySingleton<ApiService>(() => ApiService(
  //     appUrl: FlavorConfig.instance.values.appUrl));

  // AppRepository
  // locator.registerLazySingleton<AppRepository>(() => AppRepository(
  //       authService: locator.get(),
  //       apiService: locator.get(),
  //       prefRepository: locator.get(),
  //       mediaService: locator.get(),
  //     ));
}
