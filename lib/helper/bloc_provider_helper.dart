import 'package:flutter_base_bloc/bloc_provider/authentication_bloc/auth_cubit.dart';
import 'package:flutter_base_bloc/bloc_provider/bottom_navigation_bloc/bottom_navigation_cubit.dart';
import 'package:flutter_base_bloc/bloc_provider/home_bloc/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class BlocProviderHelper {
  static List<BlocProvider> providers = [
    BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
    BlocProvider<HomeCubit>(create: (context) => HomeCubit()),
    BlocProvider<BottomNavigationCubit>(create: (context) => BottomNavigationCubit()),
  ];
}