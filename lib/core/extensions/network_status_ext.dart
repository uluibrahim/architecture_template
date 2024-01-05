import '../utils/network_status_manager/network_status.dart';

extension NetworkStatus on NetworkResult {
  bool get isConnected => this == NetworkResult.on;
}
