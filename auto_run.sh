#!/bin/bash

# Define command colors
readonly COLOR_RED=`tput setaf 1`
readonly COLOR_GREEN=`tput setaf 2`
readonly COLOR_RESET=`tput sgr0`

function throw()
{
	echo "${COLOR_RED}Error!${COLOR_RESET}"
  exit $1
}

echo "${COLOR_GREEN}Creating project...${COLOR_RESET}"

# Resouces
readonly XML_COLORS="<?xml version=\"1.0\" encoding=\"utf-8\"?>
<resources>
    <color name=\"xyz\">#979797</color>
    <color name=\"xyz_material\" type=\"material\">#CF2A2A</color>
</resources>"

readonly DART_DIMENS="class Dimens {
  Dimens._();
  static const double X_Y_Z = 16.0;
}"

echo "${COLOR_GREEN}Resouces${COLOR_RESET}"
echo "Create directories"
mkdir -p assets assets/fonts assets/images assets/images/2.0x assets/images/3.0x assets/launchers assets/colors assets/dimens || throw

echo "Create sample files: colors, dimens"
touch assets/colors/colors.xml; echo "$XML_COLORS" > assets/colors/colors.xml || throw
touch assets/dimens/dimens.dart; echo "$DART_DIMENS" > assets/dimens/dimens.dart || throw

# Common
echo "${COLOR_GREEN}Common${COLOR_RESET}"
echo "Create directories"
mkdir -p lib/common lib/common/helpers lib/common/utils lib/common/interfaces lib/common/mixins || throw

# Configs
readonly DART_CONSTANTS="class Constants {
  Constants._();
  static const int X_Y_Z = 0;
}"

readonly DART_FLAVORS="enum Flavor { DEV, PRODUCTION }

class FlavorValues {
  FlavorValues({
    required this.appUrl,
  });

  final String appUrl;
}

class FlavorConfig {
  final Flavor flavor;
  final FlavorValues values;
  static late FlavorConfig _instance;

  factory FlavorConfig({required Flavor flavor, required FlavorValues values}) {
    _instance = FlavorConfig._internal(flavor, values);
    return _instance;
  }

  FlavorConfig._internal(this.flavor, this.values);

  static FlavorConfig get instance {
    return _instance;
  }

  static bool isProduction() => _instance.flavor == Flavor.PRODUCTION;

  static bool isDevelopment() => _instance.flavor == Flavor.DEV;
}"

readonly DART_ROUTES="import 'package:flutter/material.dart';

class RoutePaths {
  static const String X = \"/x\";
}

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.X:
        // List<dynamic> args = settings.arguments as List<dynamic>;
        // var x1 = args[0] as String?;
        // var x2 = args[1] as int?;
        // return MaterialPageRoute(builder: (_) => XPage(), settings: settings);
      default:
        return null;
    }
  }
}"

readonly DART_SERVICE_LOCATOR="import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future setupServiceLocator() async {
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
}"

echo "${COLOR_GREEN}Configs${COLOR_RESET}"
echo "Create directories"
mkdir -p lib/configs || throw

echo "Create sample files"
touch lib/configs/constants.dart; echo "$DART_CONSTANTS" > lib/configs/constants.dart || throw
touch lib/configs/flavors.dart; echo "$DART_FLAVORS" > lib/configs/flavors.dart || throw
touch lib/configs/routes.dart; echo "$DART_ROUTES" > lib/configs/routes.dart || throw
touch lib/configs/service_locator.dart; echo "$DART_SERVICE_LOCATOR" > lib/configs/service_locator.dart || throw

# Success
echo "${COLOR_GREEN}Success!${COLOR_RESET}"