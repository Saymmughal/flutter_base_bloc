import 'package:dio/dio.dart';
import 'package:flutter_base_bloc/helper/routes_helper.dart';
import 'package:flutter_base_bloc/main.dart';
import 'package:flutter_base_bloc/utils/constant.dart';
import 'package:flutter_base_bloc/view/widgets/custom_snackbar.dart';

import '../model/connection_model/connection_model.dart';

void apiException(
    DioException exception,String screen, {Object? arguments}) {
  ConnectionModel? connectionModel;

  void navigateToNoConnectionScreen() {
    Future.delayed(Duration.zero, () {
      navigatorKey.currentState!.pushNamed(
        RouterHelper.noConnectionScreen,
        arguments: connectionModel,
      );
    });
  }

  switch (exception.type) {
    case DioExceptionType.connectionError:
      connectionModel = ConnectionModel(
        currentScreen: screen,
        message: Constant.internetConnectionMessage,
        arguments: arguments,
      );
      navigateToNoConnectionScreen();
      break;
    case DioExceptionType.cancel:
      connectionModel = ConnectionModel(
        currentScreen: screen,
        message: Constant.requestToAPIServerWasCancelled,
        arguments: arguments,
      );
      navigateToNoConnectionScreen();
      break;
    case DioExceptionType.receiveTimeout:
      connectionModel = ConnectionModel(
        currentScreen: screen,
        message: Constant.receiveTimeOutError,
        arguments: arguments,
      );
      navigateToNoConnectionScreen();
      break;
    case DioExceptionType.sendTimeout:
      connectionModel = ConnectionModel(
        currentScreen: screen,
        message: Constant.sendTimeOutError,
        arguments: arguments,
      );
      navigateToNoConnectionScreen();
      break;
    case DioExceptionType.connectionTimeout:
      connectionModel = ConnectionModel(
        currentScreen: screen,
        message: Constant.connectionTimeOutError,
        arguments: arguments,
      );
      navigateToNoConnectionScreen();
      break;
    case DioExceptionType.badResponse:
      connectionModel = ConnectionModel(
        currentScreen: screen,
        message: Constant.somethingWentWrong,
        arguments: arguments,
      );
      switch (exception.response!.statusCode) {
        case 400:
          connectionModel.message = Constant.error400BadRequest;
          break;
        case 403:
          connectionModel.message = Constant.error403Forbidden;
          break;
        case 404:
          connectionModel.message = Constant.error404NotFound;
          break;
        case 422:
          connectionModel.message = exception.response!.data['message'];
          break;
        case 500:
          connectionModel.message = Constant.serverError500;
          break;
        default:
          break;
      }
      showToast(message: connectionModel.message, isError: true);
      break;
    default:
      showToast(message: exception.response!.data['message'], isError: true);
      break;
  }
}
