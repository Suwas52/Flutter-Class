import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String label;
  final Color? color;
  final Function callback;

  const CalculatorButton({required this.label, this.color,required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      child: ElevatedButton(
        style: ButtonStyle(

            backgroundColor: MaterialStateProperty.all(color ?? Colors.yellow),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.5)))
        ),
        onPressed: () {
          callback(label);
        },
        child: Text(label, style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            color: Colors.white
        ),),

      ),
    );
  }
}

