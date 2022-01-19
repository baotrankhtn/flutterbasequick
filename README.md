

# [Setup]
## 1. Add dependency
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
### 2.1. Resources: Images/icons, fonts, localization

```  
mkdir assets; mkdir assets/fonts; mkdir assets/images; mkdir assets/images/2.0x; mkdir assets/images/3.0x;  mkdir assets/launchers
```
*ic_* prefix for icons, *img_* prefix for images

Sample *pubspec.yaml*

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
  output_dir: lib/generated/localization

flutter_icons:
  android: true
  ios: true
  image_path: "assets/launchers/ic_launcher.png"
  adaptive_icon_background: "#ffffff"
  adaptive_icon_foreground: "assets/launchers/ic_launcher_android_foreground.png"

flutter_gen:
  output: lib/generated/assets
  null_safety: true
  integrations:
    flutter_svg: true

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
        - asset: "assets/fonts/Montserrat-Medium.ttf"
          weight: 500
```

Generate **images, icons, fonts,...**
```  
flutter pub run build_runner build --delete-conflicting-outputs  
```  

Generate **launcher icons**
```  
flutter pub run flutter_launcher_icons:main
```  

Generate **localizations (if needed)**
```  
flutter pub run intl_utils:generate
```  


###

### 2.2. Common
```  
mkdir lib/common; mkdir lib/common/helpers;  mkdir lib/common/utils; mkdir lib/common/interface; mkdir lib/common/logger; mkdir lib/common/mixins; mkdir lib/configs
```

## Add flavors
