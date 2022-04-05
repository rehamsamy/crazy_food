import 'package:connectivity_plus/connectivity_plus.dart';

class SharedMethods {
  static String reformatDate(DateTime? value) {
    if (value == null) return '';
    final reformatted = value.year.toString() +
        '-' +
        value.month.toString().padLeft(2, '0') +
        '-' +
        value.day.toString().padLeft(2, '0');
    return reformatted;
  }

  static Future<bool> checkNetwork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}
