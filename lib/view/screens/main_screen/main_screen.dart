import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_bloc/bloc_provider/bottom_navigation_bloc/bottom_navigation_cubit.dart';
import 'package:flutter_base_bloc/bloc_provider/bottom_navigation_bloc/bottom_navigation_state.dart';
import 'package:flutter_base_bloc/utils/colors.dart';
import 'package:flutter_base_bloc/view/widgets/bottom_navigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final blottomNavBloc = BlocProvider.of<BottomNavigationCubit>(context, listen: false);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: whiteStatusBar(),
      child: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor:
                blottomNavBloc.currentIndex == 1 ? greenPrimary : whitePrimary,
            body: blottomNavBloc.bottomNavigationIndex[blottomNavBloc.currentIndex],
            bottomNavigationBar: const BottomNavigation(currentIndex: 0),
          );
        },
      ),
    );
  }
}
