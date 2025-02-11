import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final color;
  // ignore: prefer_typing_uninitialized_variables
  final textColor;
  final String buttonText;
  // ignore: prefer_typing_uninitialized_variables
  final tap;

  const Mybutton(
      {super.key,
      this.color,
      this.textColor,
      required this.buttonText,
      this.tap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Padding(
        padding: const EdgeInsets.all(9),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: textColor, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
