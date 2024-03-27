import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final int number;
  final function handlePress;
  const MyButton({super.key, required this.number, required this.handlePress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
       handlePress();
      },
      child: Text('Click!' + '${number}'),
    );
  }
}
