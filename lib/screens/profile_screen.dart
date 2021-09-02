import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starwars_app/screens/login_scrren.dart';
import 'package:starwars_app/screens/widgets/csutom_text.dart';
import 'package:starwars_app/viewmodels/profile_view_model.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          body: Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                              image: DecorationImage(
                                image: AssetImage('assets/images/avatar.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'Tegar Yasindra',
                                  fontSize: 22,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                CustomText(
                                  text: "tegar.yas26@gmail.com",
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: TextButton(
                        child: ListTile(
                          title: CustomText(
                            text: 'Menu',
                            fontSize: 35,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: TextButton(
                        child: ListTile(
                          title: CustomText(
                            text: 'Edit Profile',
                          ),
                          leading: Icon(
                            Icons.mode_edit,
                            color: Colors.grey,
                          ),
                          trailing: Icon(
                            Icons.navigate_next,
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: TextButton(
                        child: ListTile(
                          title: CustomText(
                            text: 'Log Out',
                          ),
                          leading: Icon(
                            Icons.exit_to_app,
                            color: Colors.grey,
                          ),
                          trailing: Icon(
                            Icons.navigate_next,
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          controller.signOut();
                          Get.offAll(LoginScreen());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
