import 'package:flutter_easyloading/flutter_easyloading.dart';

mixin LoadingViewMixin {
  bool _isShowingInfo = false;

  void showLoading({String? msg}) {
    if (!_isShowingInfo) {
      EasyLoading.show(status: msg, maskType: EasyLoadingMaskType.black);
    }
  }

  void dismissLoading() {
    if (!_isShowingInfo) {
      EasyLoading.dismiss();
    }
  }

  void showError(String message) {
    _isShowingInfo = true;
    EasyLoading.showError(message)
      ..whenComplete(() {
        _isShowingInfo = false;
      });
  }

  void showSuccess(String message) {
    _isShowingInfo = true;
    EasyLoading.showSuccess(message)
      ..whenComplete(() {
        _isShowingInfo = false;
      });
  }
}
