import 'package:flutter/material.dart';
import 'package:notex/Style/app_color.dart';

Widget customButton(BuildContext context,
    {required VoidCallback onTap,
      required String text,
      Color? bgColor,
      Color? textColor}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: bgColor ?? AppColor.white,
            borderRadius: BorderRadius.circular(8)),
        child: Text(
          text,
          style: TextStyle(
              color: textColor ?? AppColor.primaryColor, fontFamily: ''),
        )),
  );
}
