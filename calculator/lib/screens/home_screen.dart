

import 'package:calculator/widgets/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:eval_ex/expression.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List buttons = [
    '9',
    '8',
    '7',
    '/',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '*',
    'C',
    '0',
    '=',
    '+',
  ];
  String output = "";
  String math_exp = ""; // 1+2*1/34

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 300,
              alignment: Alignment.bottomRight,
              child: Text(
                output,
                style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, i) {
                    return CalculatorButton(
                        color: Colors.purple,
                        label: buttons[i],
                        callback: (label) {
                          if(label == '='){
                            // calculate gaar
                            Expression exp = Expression(math_exp);
                            setState(() {
                              output = exp.eval().toString();
                              print(math_exp);
                              math_exp = '';

                            });
                          }else if(label == '+' || label == '-' || label == '*' || label == '/'){
                            // Operation button is pressed
                            setState(() {
                              output = '';
                              math_exp = math_exp + label;
                            });
                          }else if(label == "C"){
                            setState((){
                              output='';
                            });
                          }else{
                            if(math_exp == '') {
                              output = '';
                            }
                            setState(() {
                              output = output + label;
                              math_exp = math_exp + label;
                            });

                          }



                        });
                  }),
            )
          ],
        ),
      ),
    );
  }
}



/* GridView.builder(
          itemCount: buttonLabel.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
            itemBuilder: (context, index) {
             return Container(
               color: Colors.red,
               margin: EdgeInsets.all(10),
               child: Center(
                 child: Text(
                     buttonLabel[index],
                   ,style: TextStyle(
                   color: Colors.white,
                   fontWeight: FontWeight.bold,
                   fontSize: 30
                 ),),
               ),
             );
            }) */
