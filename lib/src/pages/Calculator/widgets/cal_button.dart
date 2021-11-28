import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final color;
  final colorText;
  final String textButton;
  final buttonTapped;

  const CalculatorButton(
      {this.color,
      this.colorText,
      required this.textButton,
      this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(0.2),
        child: ClipRRect(
          child: Container(
            color: color,
            child: Center(
              child: Text(
                textButton,
                style: TextStyle(
                  color: colorText,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
