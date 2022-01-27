> This is a package used to create basic project using BLOC, some common libraries.    
> And it provides some common components like text, button, bloc, network, logger,...           

# Setup
## 1. Add base project dependency
```
dependencies:
  flutter:
    sdk: flutter
    
  flutterquick:
    git:
      url: https://github.com/baotrankhtn/flutterbasequick.git
      ref: develop # branch
      path: flutterquick
```

Force update git dependencies
```  
flutter packages upgrade
```

## 2. Add resource dependencies

```
dependencies:
  flutter:
    sdk: flutter

  # Localization
  flutter_localizations: 
    sdk: flutter
  intl: ^0.17.0
  intl_utils: ^2.6.1 

dev_dependencies:
  flutter_test:
    sdk: flutter

  # Generate launcher icons
  flutter_launcher_icons: ^0.9.2

  # Generate images, fonts,...
  build_runner:
  flutter_gen_runner:

flutter_intl:
  enabled: true
  output_dir: lib/gen/localization

flutter_icons:
  android: true
  ios: true
  image_path: "assets/launchers/ic_launcher.png"
  adaptive_icon_background: "#ffffff"
  adaptive_icon_foreground: "assets/launchers/ic_launcher_android_foreground.png"

flutter_gen:
  output: lib/gen/assets
  null_safety: true
  integrations:
    flutter_svg: true
  colors:
    inputs:
      - assets/colors/colors.xml

flutter:
  uses-material-design: true

  assets:
    - assets/images/
    
  fonts:
    - family: PlayfairDisplay
      fonts:
        - asset: "assets/fonts/PlayfairDisplay-Bold.ttf"
          weight: 700
    - family: Monstserrat
      fonts:
        - asset: "assets/fonts/Montserrat-Light.ttf"
          weight: 300
        - asset: "assets/fonts/Montserrat-Regular.ttf"
          weight: 400
```

## 3. Add core dependencies
```
dependencies: 
  # Bloc
  flutter_bloc: ^8.0.1

  # Inversion of control
  get_it: ^7.2.0
  
  # Network
  http: ^0.13.3
```

## 4. Autorun
Run *auto_run.sh* to create sample project files
```
bash path/to/auto_run.sh
```

## 5. Initialize base project

# Project structure
```
- assets/ -> Resouces 
  |- colors/
  |- dimens/
  |- fonts/
  |- images/
  |- launchers/
- lib/
  |- bloc/ 
  |- comnmon/
     |- helpers/
     |- interfaces/
     |- mixins/
     |- utils/
  |- configs/ -> Important configs 
  |- data/ -> Models, repositories
  |- presentation/
     |- dialogs/
     |- pages/
     |- widgets/
  |- app.dart -> Base app widget configs
  |- main-prod.dart -> App entry for production mode
  |- main.dart -> App entry for development mode
```
## 1. Resources

images/icons, launcher icons, fonts, localization, colors, dimens

*ic_* prefix for icons, *img_* prefix for images

### Sample files: colors, dimens
```
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <color name="xyz">#979797</color>
    <color name="xyz_material" type="material">#CF2A2A</color>
</resources>
```

```
class Dimens {
  Dimens._();
  static const double xyz = 16.0;
}
```

### Generation
```  
flutter pub run build_runner build --delete-conflicting-outputs REM generate images, icons, fonts, colors
```  

```  
flutter pub run flutter_launcher_icons:main REM genetate launcher icons
```  

```  
flutter pub run intl_utils:generate REM generate localizations if needed
```  

### Usage 
```
Assets.images.icXYZ.image()
Assets.images.icXYZ.path

FontFamily.XYZ

ColorName.XYZ
```

## 2. Common
Helpers, utils, mixins, logger, interfaces,...

*Helper* postfix for helpers, *Util* postfix for utilitities, *Mixin* postfix for mixins, *Logger* postfix for logger, *I* prefix for interfaces

## 3. Configs
Constants, flavors (Flutter-scope), routes, service locator (inversion of control),...

Global constants of app defined in constants.dart
```
class Constants {
  Constants._();
  static const int X_Y_Z = 0;
}

```

Main flavors for **Flutter-scope** are defined in flavor.dart (flavors for **native-scope** will be discussed later)
```
enum Flavor { DEV, PRODUCTION }

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
}
```

Route paths in routes.dart
```
import 'package:flutter/material.dart';

class RoutePaths {
  static const String X = "/x";
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
}
```

Access service locator
```
locator.get()
```
```
import 'package:get_it/get_it.dart';

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
}
```

# Add flavors


> Copyright (c) baotran
