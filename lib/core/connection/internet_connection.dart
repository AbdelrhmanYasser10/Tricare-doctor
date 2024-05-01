import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionService {
  Future<bool> isInternetConnected() async {
    var connectivity = await Connectivity().checkConnectivity();
    return connectivity == ConnectivityResult.ethernet || connectivity == ConnectivityResult.wifi || connectivity == ConnectivityResult.mobile;
  }
}