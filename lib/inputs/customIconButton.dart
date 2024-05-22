// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Function onPressd;
  final String text;
  final Color color;
  final Color colorText;
  final bool isFilled;
  final IconData? icon;
  final double width;
  final double height;

  const CustomIconButton({
    Key? key,
    required this.onPressd,
    required this.text,
    this.width = 200,
    this.height = 48,
    this.icon,
    this.color = Colors.indigo,
    this.isFilled = false,
    this.colorText = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: height,
      width: width,
      child: OutlinedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
            backgroundColor: MaterialStateProperty.all(color.withOpacity(0.8)),
            overlayColor: MaterialStateProperty.all(color.withOpacity(0.0))),
        onPressed: () => onPressd(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: colorText,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(color: colorText),
            )
          ],
        ),
      ),
    );
  }
}
