import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gondwana_club/global_style/style.dart';

class AppPayButton extends StatelessWidget {
  final Color? backgorundColor;
  final Color? textColor;
  final Function()? onTap;
  final bool? isBorder;
  final String text;
  const AppPayButton(
      {Key? key,
      this.backgorundColor: AppColor.mainColor,
      this.textColor,
      this.onTap,
      this.isBorder: false,
      required this.text, color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 50, right: 50),
        height: 50,
        width: MediaQuery.of(context).size.width - 100,
        decoration: BoxDecoration(
            color: backgorundColor,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 2,
              color: AppColor.mainColor,
            )),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: textColor),
          ),
        ),
      ),
    );
  }
}
