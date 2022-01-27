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

echo "${COLOR_GREEN}Resouces${COLOR_RESET}"
echo "Create directories"
mkdir -p assets assets/fonts assets/images assets/images/2.0x assets/images/3.0x assets/launchers assets/colors || throw

echo "Create sample files"
touch assets/colors/colors.xml; echo "$XML_COLORS" > assets/colors/colors.xml || throw

# Common
readonly DART_DIMENS="class Dimens {
  Dimens._();
  static const double X_Y_Z = 16.0;
}"

readonly DART_FONT_SIZES="class FontSize {
  FontSize._();

  static const double SMALL_3 = 6;
  static const double SMALL_2 = 8;
  static const double SMALL_1 = 10;
  static const double SMALL = 12;
  static const double MEDIUM = 14;
  static const double BIG = 16;
  static const double BIG_1 = 18;
  static const double BIG_2 = 20;
  static const double BIG_3 = 22;
  static const double BIG_4 = 24;
  static const double BIG_5 = 26;
  static const double BIG_6 = 28;
}"

echo "${COLOR_GREEN}Common${COLOR_RESET}"
echo "Create directories"
mkdir -p lib/common lib/common/helpers lib/common/utils lib/common/interfaces lib/common/mixins lib/common/values || throw

echo "Create sample files"
touch lib/common/values/dimens.dart; echo "$DART_DIMENS" > lib/common/values/dimens.dart || throw
touch lib/common/values/font_sizes.dart; echo "$DART_FONT_SIZES" > lib/common/values/font_sizes.dart || throw

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