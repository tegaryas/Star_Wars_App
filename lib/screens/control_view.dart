import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starwars_app/screens/widgets/custom_text_navbar.dart';
import 'package:starwars_app/viewmodels/control_view_model.dart';

class ControllView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => Scaffold(
        body: controller.currentScreen,
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: Get.put(ControlViewModel()),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CustomTextNavBar(
                text: 'Beranda',
                alignment: Alignment.center,
                color: Colors.white,
              ),
            ),
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Icon(Icons.home),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CustomTextNavBar(
                text: 'Favorite',
                alignment: Alignment.center,
                color: Colors.white,
              ),
            ),
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Icon(Icons.favorite),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CustomTextNavBar(
                text: 'Akun',
                alignment: Alignment.center,
                color: Colors.white,
              ),
            ),
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Icon(Icons.account_circle),
            ),
          ),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
        elevation: 0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
