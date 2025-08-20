import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/main.dart';

// Can pop Route or not
bool canGoBack() => Navigator.canPop(navigatorKey.currentContext!);
// May be pop Route or not
Future<bool> maybeGoBack() => Navigator.maybePop(navigatorKey.currentContext!);
// pop Route
void goBack() =>
    canGoBack() ? Navigator.pop(navigatorKey.currentContext!) : null;
// Pop Until Route
void goBackUntil(String routeName) => Navigator.popUntil(
  navigatorKey.currentContext!,
  ModalRoute.withName(routeName),
);
// Push Named Route
Future<Object?> goToNamed(String routeName, {Object? arguments}) =>
    Navigator.pushNamed(
      navigatorKey.currentContext!,
      routeName,
      arguments: arguments,
    );
// Push And Replace Named Route
Future<Object?> goReplacementNamed(String routeName, {Object? arguments}) =>
    Navigator.pushReplacementNamed(
      navigatorKey.currentContext!,
      routeName,
      arguments: arguments,
    );
// Push Named and Remove Until Route
Future<Object?> goNamedAndRemoveUntil(String routeName) =>
    Navigator.pushNamedAndRemoveUntil(
      navigatorKey.currentContext!,
      routeName,
      (route) => false,
    );
// Pop And Push Named Route
Future<Object?> goBackAndForwardNamed(String routeName, {Object? arguments}) =>
    Navigator.popAndPushNamed(
      navigatorKey.currentContext!,
      routeName,
      arguments: arguments,
    );
// Default Route Name
String defaultRouteName() => Navigator.defaultRouteName;
// Restorable Pop and Push Named Route
String restorableGoBackAndForwardNamed(String routeName, {Object? arguments}) =>
    Navigator.restorablePopAndPushNamed(
      navigatorKey.currentContext!,
      routeName,
      arguments: arguments,
    );
// Restorable Push Named Route
String restorableForwardNamed(String routeName, {Object? arguments}) =>
    Navigator.restorablePushNamed(
      navigatorKey.currentContext!,
      routeName,
      arguments: arguments,
    );
// Restorable Push Named And Remove Until Route
String restorableForwardNamedAndRemoveUntil(String routeName) =>
    Navigator.restorablePushNamedAndRemoveUntil(
      navigatorKey.currentContext!,
      routeName,
      (route) => false,
    );
// Restorable Push Remplacement Named Route
String restorableForwardReplacementNamed(
  String routeName, {
  Object? arguments,
}) => Navigator.restorablePushReplacementNamed(
  navigatorKey.currentContext!,
  routeName,
  arguments: arguments,
);

// Pop If Can
void goBackIfCan({Future<Object?>? elseCondition}) {
  if (canGoBack()) {
    goBack();
  } else {
    elseCondition;
  }
}

void goAndRemoveAllPath(String routeName, {Object? arguments}) {
  if (canGoBack()) {
    Navigator.popUntil(navigatorKey.currentContext!, (route) => route.isFirst);
  }
  goReplacementNamed(routeName, arguments: arguments);
}

void goForwardAndBackUntilPath(
  String currentScreen,
  String routeName, {
  Object? arguments,
}) {
  if (canGoBack()) {
    goBackUntil(currentScreen);
  }
  goReplacementNamed(routeName, arguments: arguments);
}
