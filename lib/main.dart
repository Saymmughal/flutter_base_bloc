import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_bloc/utils/app_styles/app_theme_data.dart';
import 'package:flutter_base_bloc/utils/env_configuration/load_env_file.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base_bloc/helper/routes_helper.dart';
import 'package:flutter_base_bloc/helper/scroll_behaviour.dart';
import 'package:flutter_base_bloc/bloc/theme_bloc/theme_bloc.dart';
import 'package:flutter_base_bloc/bloc/app_bloc.dart';
import 'package:flutter_base_bloc/utils/app_strings.dart';

import 'helper/connection_manager.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Load environment variables
  await LoadEnvFile.load();
  // For Firebase Initialization
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // FirebaseMessaging.instance.getToken().then((value) {
  //   debugPrint("Token =======================>>>>>>>>>>> : $value");
  // });
  // FirebaseMessaging.instance.requestPermission();
  // To initialize Push notifications
  // await NotificationService().initialize();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const AppBloc(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ConnectionManager().initialize();

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          builder: (context, child) {
            return ScrollConfiguration(
              behavior: MyBehavior(),
              child: MediaQuery(
                data: MediaQuery.of(
                  context,
                ).copyWith(textScaler: const TextScaler.linear(1.0)),
                child: child!,
              ),
            );
          },
          debugShowCheckedModeBanner: false,
          title: AppStrings.appTitle,
          theme: AppThemeData.lightTheme,
          darkTheme: AppThemeData.darkTheme,
          themeMode: _getThemeMode(state.themeMode),
          initialRoute: RouterHelper.initial,
          routes: RouterHelper.routes,
        );
      },
    );
  }

  ThemeMode _getThemeMode(AppThemeMode themeMode) {
    switch (themeMode) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
        return ThemeMode.system;
    }
  }
}
