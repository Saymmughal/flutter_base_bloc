import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base_bloc/bloc/auth_bloc/login_bloc.dart';
import 'package:flutter_base_bloc/bloc/auth_bloc/forgot_password_bloc.dart';
import 'package:flutter_base_bloc/bloc/theme_bloc/theme_bloc.dart';
import 'package:flutter_base_bloc/bloc/navigation_bloc/bottom_navigation_bloc.dart';
import 'package:flutter_base_bloc/bloc/home_bloc/home_bloc.dart';
import 'package:flutter_base_bloc/data/repository/api_repo.dart';

class AppBloc extends StatelessWidget {
  final Widget child;

  const AppBloc({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc()..add(ThemeLoaded()),
        ),
        BlocProvider<LoginBloc>(create: (context) => LoginBloc(ApiRepo())),
        BlocProvider<ForgotPasswordBloc>(
          create: (context) => ForgotPasswordBloc(ApiRepo()),
        ),
        BlocProvider<BottomNavigationBloc>(
          create: (context) => BottomNavigationBloc(),
        ),
        BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
      ],
      child: child,
    );
  }
}
