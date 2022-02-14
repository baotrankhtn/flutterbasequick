import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future setupServiceLocator() async {
  // TODO: Remove this demo

  // PrefRepository
  // final sharedPreferences = await SharedPreferences.getInstance();
  // locator.registerLazySingleton<PrefRepository>(
  //     () => PrefRepository(sharedPreferences));

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
