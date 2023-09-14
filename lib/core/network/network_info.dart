import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:tech_task/core/extension/context.dart';
import 'package:tech_task/core/secure-storage/secure.dart';
import 'package:tech_task/core/widgets/network_msg.dart';
import 'package:tech_task/main.dart';

abstract class NetworkInfo {
  Future<bool> isConnected();
  StreamSubscription<ConnectivityResult> getConnectivity();
  void cancelInternetChecker();
}

@LazySingleton(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  NetworkInfoImpl({
    required this.storage,
  });

  final SecureStorage storage;

  @override
  Future<bool> isConnected() async {
    try {
      final List<InternetAddress> result =
          await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  late StreamSubscription internetCheckerSubscription;
  bool isDeviceConnected = false;

  @override
  StreamSubscription<ConnectivityResult> getConnectivity() =>
      internetCheckerSubscription =
          Connectivity().onConnectivityChanged.listen((event) async {
        isDeviceConnected = await isConnected();
        final networkStatus = storage.getFrom('EXCROW_NETWORK_STATUS');

        if (!isDeviceConnected) {
          if (networkStatus != 'NO_NETWORK') {
            storage.setTo('EXCROW_NETWORK_STATUS', 'NO_NETWORK');
            navkey.currentContext!.notify.addNotification(
              const NetowrkMessage(error: true),
            );
          }
        } else {
          if (networkStatus == 'NO_NETWORK') {
            storage.setTo('EXCROW_NETWORK_STATUS', 'NETWORK_AVAILABLE');
            navkey.currentContext!.notify.removeNotification();

            navkey.currentContext!.notify.addNotification(
              const NetowrkMessage(error: false),
            );
          }
        }
      });

  @override
  void cancelInternetChecker() {
    internetCheckerSubscription.cancel();
  }
}
