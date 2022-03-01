
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
**[get_it](https://pub.dev/packages/get_it)**: Inversion of control.  
**[http](https://pub.dev/packages/http), [connectivity_plus](https://pub.dev/packages/connectivity_plus)**: Network calls, network check.  
**[flutter_easyloading](https://pub.dev/packages/flutter_easyloading)**: Simple loading, toast.  
**[shared_preferences](https://pub.dev/packages/shared_preferences)**: Local persistence.  

# Setup

# Project structure
```
- assets/ -> resources 
  |- colors/
  |- dimens/
  |- fonts/
  |- images/
  |- launchers/
- lib/
  |- bloc/ --------------------> [BLOC]
  |- comnmon/ -> assistants
     |- helpers/
     |- interfaces/
     |- mixins/
     |- utils/
  |- configs/ -> important configurations
  |- data/ --------------------> [MODEL]
  |- presentation/ ------------> [VIEW]
     |- dialogs/
     |- pages/
     |- widgets/
  |- app.dart -> Base app widget configs
  |- main-prod.dart -> App entry for production mode
  |- main.dart -> App entry for development mode
```
# Common commands

```  
flutter pub run build_runner build --delete-conflicting-outputs REM generate images, icons, fonts, colors
```  

```  
flutter pub run flutter_launcher_icons:main REM genetate launcher icons
```  

```  
flutter pub run intl_utils:generate REM generate localizations if needed
```  

# Add flavors


> Copyright (c)
