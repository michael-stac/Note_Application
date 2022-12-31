import 'package:flutter/material.dart';

import '../Style/app_color.dart';


class SocialButton extends StatelessWidget {
  SocialButton({required this.text, required this.icon, this.onTap});

  final String text;
  Color? bgColor;

  final Widget icon;
  final VoidCallback? onTap;

  //Color Instance

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(

            // color: AppColor.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColor.primaryColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(
              width: 20,
            ),
            Text(text, style: TextStyle(color: AppColor.black, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
