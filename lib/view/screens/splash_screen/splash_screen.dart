import 'dart:async';

import 'package:flutter_base_bloc/helper/router_navigator.dart';
import 'package:flutter_base_bloc/helper/routes_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_bloc/utils/colors.dart';
import 'package:flutter_base_bloc/utils/dimension.dart';
import 'package:flutter_base_bloc/view/widgets/extention/string_extension.dart';
import 'package:flutter_base_bloc/view/widgets/extention/widget_extension.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    routes();
  }

  void routes() async {
    Timer(const Duration(seconds: 3), () async {
      //   bool? isLogin = await LocalDb.getLogin;
      //   if (isLogin == true) {
      //   } else {
      goReplacementNamed(RouterHelper.mainScreen);
      //   }
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQuerySize(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: whiteStatusBar(),
      child: Scaffold(
          body: Container(
        child: 'Splash Screen'.toText(),
      ).center),
    );
  }
}
