import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starwars_app/screens/favorit_screen.dart';
import 'package:starwars_app/screens/home_screen.dart';
import 'package:starwars_app/screens/profile_screen.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;

  get navigatorValue => _navigatorValue;

  Widget currentScreen = HomeScreen();

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          currentScreen = HomeScreen();
          break;
        }
      case 1:
        {
          currentScreen = FavoriteScreen();
          break;
        }
      case 2:
        {
          currentScreen = ProfileScreen();
          break;
        }
    }
    update();
  }
}
