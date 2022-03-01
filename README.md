
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
  |- data/ --------------------> [MODEL] Models, repositories
  |- l10n/ -> Strings
  |- presentation/ ------------> [VIEW]
     |- dialogs/
     |- pages/
     |- widgets/
  |- app.dart -> Base app widget configs
  |- main-prod.dart -> App entry for production mode
  |- main.dart -> App entry for development mode
```

# Setup
Just this section is enough to inject base files to client project
***Create client project***

***Inject base files***

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
***Run & Build***

# Add flavors
Check [Android & iOS configurations](https://medium.com/@animeshjain/build-flavors-in-flutter-android-and-ios-with-different-firebase-projects-per-flavor-27c5c5dac10b)

# Acknowledgements
Inspired by ***Fractal Mobile Team***'s ideas, projects, people.  
