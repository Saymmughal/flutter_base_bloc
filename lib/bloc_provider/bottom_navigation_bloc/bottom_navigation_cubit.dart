import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/bloc_provider/bottom_navigation_bloc/bottom_navigation_state.dart';
import 'package:flutter_base_bloc/view/screens/home_screen/home_screen.dart';
import 'package:flutter_base_bloc/view/screens/menu_screen/menu_screeen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavInitialState());
  int currentIndex = 0;
  // Screens List
  /*=========================================================================
      Define ther screens we are going to navigate from botton navigation bar
      in bottomNavigationIndex list
    ========================================================================*/
  List<Widget> bottomNavigationIndex = [const HomeScreen(), const MenuScreen()];
  // set Current Index
  setCurrentIndex(int newIndex) {
    currentIndex = newIndex;
    newIndex == 0
        ? emit(BottomNavInitialState())
        : emit(BottomNavChangeState());
  }

  // Rest Index
  resetIndex() {
    currentIndex = 0;
    emit(BottomNavInitialState());
  }

/*=====================================
  APIs calling
 ======================================*/
  // Veriables
}
