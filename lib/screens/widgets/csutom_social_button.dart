import 'package:flutter/material.dart';
import 'package:starwars_app/screens/widgets/csutom_text.dart';

class CustomSocialButton extends StatelessWidget {
  final String text;
  final String imageUrl;
  final void Function()? onPressed;
  CustomSocialButton({
    required this.text,
    required this.imageUrl,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: Colors.grey.shade200),
      // ignore: deprecated_member_use
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              width: 50,
            ),
            CustomText(
              text: text,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
