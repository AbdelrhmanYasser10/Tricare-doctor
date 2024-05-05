import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionService {
  Future<bool> isInternetConnected() async {
    var connectivity = await Connectivity().checkConnectivity();
    return connectivity.first == ConnectivityResult.ethernet || connectivity.first == ConnectivityResult.wifi || connectivity.first == ConnectivityResult.mobile;
  }
}