
# Architechture
BLOC

# Core libraries

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
