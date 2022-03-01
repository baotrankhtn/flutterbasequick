
# Architechture
```
 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
|                                     |
|      _ _   .        _ _    _ _      |
|     |    \ |      |    | |    \     |
|     |_ _ / |      |    | |          |
|     |    \ |      |    | |          |
|     |_ _ / |_ __| '_ _ '  \_ _/     |
|                                     |
'_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _'

```

# Core libraries

**[intl](https://pub.dev/packages/intl), [intl_utils](https://pub.dev/packages/intl_utils)**: Localization, date/time formatting, parsing.  
**[flutter_bloc](https://pub.dev/packages/flutter_bloc)**: BLOC.  
**[get_it](https://pub.dev/packages/get_it)**: Inversion of control (IoC).  
**[http](https://pub.dev/packages/http), [connectivity_plus](https://pub.dev/packages/connectivity_plus)**: Network calls, network check.  
**[flutter_easyloading](https://pub.dev/packages/flutter_easyloading)**: Simple loading, toast.  
**[shared_preferences](https://pub.dev/packages/shared_preferences)**: Local persistence.  

# Project structure
***Suppose that there are 2 flavors: dev (development mode) & prod (production mode)***       

```
- assets/ -> Resources 
  |- colors/
  |- fonts/
  |- images/
  |- launchers/
- lib/
  |- bloc/ --------------------> [BLOC]
  |- comnmon/ -> Assistants
     |- helpers/
     |- interfaces/
     |- mixins/
     |- utils/
     |- values/ -> Dimensions, font sizes
  |- configs/ -> Important configurations: constants, flavors, routes, IoC
  |- data/ --------------------> [MODEL]
     |- exceptions/
     |- local/
     |- models/
     |- remote/
     |- app_repository.dart
  |- l10n/ -> Strings
  |- presentation/ ------------> [VIEW]
     |- dialogs/
     |- pages/
     |- widgets/
  |- app.dart -> Base app widget configs
  |- main-prod.dart -> App entry for prod flavor
  |- main.dart -> App entry for dev flavor
```

# Setup
Just this section is enough to inject base files to client project.  
***Create client project***

***Inject base files***

# Add flavors
Check [Android & iOS configurations](https://medium.com/@animeshjain/build-flavors-in-flutter-android-and-ios-with-different-firebase-projects-per-flavor-27c5c5dac10b)

# Common commands
***Generating files***
```  
flutter pub run build_runner build --delete-conflicting-outputs REM generate images, icons, fonts, colors
```  

```  
flutter pub run flutter_launcher_icons:main REM genetate launcher icons
```  

```  
flutter pub run intl_utils:generate REM generate localizations if needed
```  

***Run & Build dev flavor***
```
flutter run --flavor dev -t lib/main.dart REM run debug
```
```
flutter run --release --flavor dev -t lib/main.dart REM run release
```
```
flutter build <apk/ipa/...> --flavor dev -t lib/main.dart REM build debug
```
```
flutter build <apk/ipa/...> --release --flavor dev -t lib/main.dart REM build release
```
***Run & Build prod flavor***
```
flutter run --flavor prod -t lib/main-prod.dart REM run debug
```
```
flutter run --release --flavor prod -t lib/main-prod.dart REM run release
```
```
flutter build <apk/ipa/...> --flavor prod -t lib/main-prod.dart REM build debug
```
```
flutter build <apk/ipa/...> --release --flavor prod -t lib/main-prod.dart REM build release
```

# Acknowledgements
Inspired by ***Fractal Mobile Team***'s ideas, projects, people.  
