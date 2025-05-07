import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/helper/router_navigator.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter_base_bloc/data/model/connection_model/connection_model.dart';
import 'package:flutter_base_bloc/utils/constant.dart';
import '../helper/routes_helper.dart';

Future<bool> checkInternet(
  NavigatorState navigator,
  String screen,
  {Object? arguments}
) async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult.any((element) => element == ConnectivityResult.mobile)) {
    if (await InternetConnectionChecker.instance.hasConnection) {
      debugPrint("Connected with mobile");
      return true;
    } else {
      debugPrint("no connection");
      navigateToNoConnectionScreen(screen, arguments: arguments);
      return false;
    }
  } else if (connectivityResult.any((element) => element == ConnectivityResult.wifi)) {
    if (await InternetConnectionChecker.instance.hasConnection) {
      debugPrint("Connected with wifi");
      return true;
    } else {
      navigateToNoConnectionScreen(screen, arguments: arguments);
      debugPrint("no connection");
      return false;
    }
  } else {
    debugPrint(" not Connected");
    navigateToNoConnectionScreen(screen, arguments: arguments);
    return false;
  }
}

void navigateToNoConnectionScreen(String screen, {Object? arguments}) {
  Future.delayed(Duration.zero, () {
    goReplacementNamed(
      RouterHelper.noConnectionScreen,
      arguments: ConnectionModel(
        currentScreen: screen,
        message: Constant.internetConnectionMessage,
        arguments: arguments,
      ),
    );
  });
}
