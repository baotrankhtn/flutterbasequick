

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

## 2. Project structure

### 2.1. Resources: images/icons, launcher icons, fonts, localization, colors, dimens

*ic_* prefix for icons, *img_* prefix for images

#### Create directories
```  
mkdir -p assets assets/fonts assets/images assets/images/2.0x assets/images/3.0x assets/launchers assets/colors assets/dimens
```

#### Create sample files: colors, dimens
```
touch assets/colors/colors.xml; echo "<?xml version="1.0" encoding="utf-8"?>
<resources>
    <color name="xyz">#979797</color>
    <color name="xyz_material" type="material">#CF2A2A</color>
</resources>" >> assets/colors/colors.xml
```

```
touch assets/dimens/dimens.dart; echo "class AppDimen {
  AppDimen._();
  static const double xyz = 16.0;
}" >> assets/dimens/dimens.dart
```

#### Sample *pubspec.yaml*

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

#### Generation
```  
flutter pub run build_runner build --delete-conflicting-outputs REM generate images, icons, fonts, colors
```  

```  
flutter pub run flutter_launcher_icons:main REM genetate launcher icons
```  

```  
flutter pub run intl_utils:generate REM generate localizations if needed
```  

#### Usage 
```
Assets.images.icXYZ.image()
Assets.images.icXYZ.path

FontFamily.XYZ

ColorName.XYZ
```

###

### 2.2. Common
```  
mkdir lib/common; mkdir lib/common/helpers;  mkdir lib/common/utils; mkdir lib/common/interface; mkdir lib/common/logger; mkdir lib/common/mixins; mkdir lib/configs
```

## Add flavors
