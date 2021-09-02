import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:starwars_app/screens/widgets/csutom_social_button.dart';
import 'package:starwars_app/screens/widgets/csutom_text.dart';
import 'package:starwars_app/viewmodels/auth_view_model.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/galaxy.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: 'Login',
                fontSize: 50,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 15,
              ),
              CustomText(
                text: 'Login untuk masuk ke Star Wars App',
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                child: CustomSocialButton(
                  text: 'Sign dengan Google',
                  imageUrl: 'assets/images/icon_google.png',
                  onPressed: () {
                    controller.googleSignInMethod();
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CustomText(
                text:
                    'Terima kasih banyak buat Majoo Indonesia\nsudah memberikan saya kesempatan ini',
                fontSize: 16,
                maxLine: 2,
                height: 1.5,
                fontWeight: FontWeight.w400,
                alignment: Alignment.center,
                textAlign: TextAlign.center,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
