import 'package:flutter_base_bloc/data/model/connection_model/connection_model.dart';
import 'package:flutter_base_bloc/helper/router_navigator.dart';
import 'package:flutter_base_bloc/helper/routes_helper.dart';
import 'package:flutter_base_bloc/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_bloc/view/widgets/extention/string_extension.dart';
import 'package:flutter_base_bloc/view/widgets/extention/widget_extension.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    callingAPIs();
    super.initState();
  }

  callingAPIs() {
    // Call APIs
  }
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: whiteStatusBar(),
      child: Scaffold(
          body: Container(
        child: 'Home Screen'.toText().onPress(
              () => goToNamed(RouterHelper.noConnectionScreen,
                  arguments: ConnectionModel(
                      currentScreen: RouterHelper.mainScreen,
                      message: 'NO Connection')),
            ),
      ).center),
    );
  }
}
