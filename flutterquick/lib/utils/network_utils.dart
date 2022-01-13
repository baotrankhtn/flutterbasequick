import 'package:connectivity_plus/connectivity_plus.dart';

class BaseNetworkUtils {
  static Future<bool> isNetworkAvailable() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    return true;
  }
}
