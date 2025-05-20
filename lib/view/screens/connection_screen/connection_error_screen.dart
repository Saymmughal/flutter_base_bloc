import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/helper/router_navigator.dart';
import 'package:flutter_base_bloc/helper/routes_helper.dart';
import 'package:flutter_base_bloc/utils/constant.dart';
import 'package:flutter_base_bloc/view/widgets/custom_button.dart';
import 'package:flutter_base_bloc/view/widgets/extention/int_extension.dart';
import 'package:flutter_base_bloc/view/widgets/extention/string_extension.dart';
import 'package:flutter_base_bloc/view/widgets/extention/widget_extension.dart';

import '../../../data/model/connection_model/connection_model.dart';
import '../../../utils/colors.dart';

class NoConnection extends StatelessWidget {
  const NoConnection({super.key});

  @override
  Widget build(BuildContext context) {
    ConnectionModel args =
        ModalRoute.of(context)!.settings.arguments as ConnectionModel;

    debugPrint("screen is : ${args.currentScreen}");
    debugPrint("message is : ${args.message}");
    debugPrint("Current Screen : ${ModalRoute.of(context)!.settings.name}");

    return PopScope(
      canPop: false, // false or true
      onPopInvokedWithResult: (didPop, result) {
        /* ================================================================================================
        [canPop: true]
        if canPop is true then it will go to the check (didPop == true) then you can only have to call the function.

        [canPop: false]
        if canPop is false then it will go to the check (didPop == false) then you have to write  if (didPop) return;
        and then tou can use function and push or pop function
        =================================================================================================== */
        if (didPop) return;
        debugPrint(
            "POPSCOpe Called ================================================================> $didPop");
        goBackUntil(args.currentScreen);
      },
      child: Scaffold(
        backgroundColor: whitePrimary,
        appBar: AppBar(
          backgroundColor: whitePrimary,
          elevation: 0,
          // Back Button on
          // leading:
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Error Icon
              16.height,
              SizedBox(
                width: 312,
                child: args.message.to18W500Text(
                  textAlign: TextAlign.center,
                  maxLine: 2,
                  color: whitePrimary,
                ),
              ),
              32.height,
              CustomButton(
                buttonName: Constant.tryAgain,
                buttonTextColor: whitePrimary,
                onPressed: () => goForwardAndBackUntilPath(
                    RouterHelper.noConnectionScreen, args.currentScreen,
                    arguments: args.arguments),
              ),
            ],
          ).paddingSymmetric(horizontal: 16.w),
        ),
      ),
    );
  }
}
