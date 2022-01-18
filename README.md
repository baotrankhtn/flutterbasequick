# flutterbasequick

### [Setup]
#### 1. Add dependency
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
```bash  
flutter packages upgrade
```

#### 2. Create project directories
##### 2.1. Assets

*ic_* prefix for icons, *img_* prefix for images

```bash  
mkdir assets; mkdir assets/fonts; mkdir assets/images; mkdir assets/images/2.0x; mkdir assets/images/3.0x;  mkdir assets/launchers
```

##### 2.2. Common
```bash  
mkdir lib/common; mkdir lib/common/helpers;  mkdir lib/common/utils; mkdir lib/common/interface; mkdir lib/common/logger; mkdir lib/common/mixins; mkdir lib/configs
```

#### Add flavors
