import 'package:connectivity_plus/connectivity_plus.dart';

enum NetworkResult {
  on,
  off;

  static NetworkResult checkConnectivityResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.ethernet:
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        return NetworkResult.on;
      default:
        return NetworkResult.off;
    }
  }
}
