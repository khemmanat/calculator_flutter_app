import 'package:calculator_flutter_app/src/pages/Calculator/widgets/cal_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  var input = 0;
  var result = 0;
  // Array of button
  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Calculator Page'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Container(
                    child: Column(children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  '$input',
                  style: const TextStyle(fontSize: 50),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  '$result',
                  style: const TextStyle(fontSize: 50),
                ),
              ),
            ]))),
            Expanded(
                flex: 3,
                child: Container(
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                        itemBuilder: (BuildContext context, int index) {
                          // For Clearing the Button
                          if (index == 0) {
                            return CalculatorButton(
                              buttonTapped: () {
                                setState(() {
                                  input = 0;
                                  result = 0;
                                });
                              },
                              textButton: buttons[index],
                              color: Colors.blue[50],
                              colorText: Colors.black,
                            );
                          } else if (index == 1) {
                            return CalculatorButton(
                              textButton: buttons[index],
                              color: Colors.blue[50],
                              colorText: Colors.black,
                            );
                          } else if (index == 2) {
                            return CalculatorButton(
                              buttonTapped: () {
                                setState(() {
                                  input += buttons[index] as int;
                                });
                              },
                              textButton: buttons[index],
                              color: Colors.blue[50],
                              colorText: Colors.black,
                            );
                          } else if (index == 3) {
                            return CalculatorButton(
                              buttonTapped: () {
                                setState(() {
                                  input = input.substring(0, input.length - 1);
                                });
                              },
                              textButton: buttons[index],
                              color: Colors.blue[50],
                              colorText: Colors.black,
                            );
                          } else if (index == 18) {
                            return CalculatorButton(
                              buttonTapped: () {
                                setState(() {
                                  input = input * 10 + 7;
                                });
                              },
                              textButton: buttons[index],
                              color: Colors.blue[50],
                              colorText: Colors.black,
                            );
                          } else {}
                        })))
          ],
        ));
  }

  // bool operatorVerify(String x) {
  //   if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
  //     return true;
  //   }
  //   return false;
  // }

  // the function that calculate the result
  // void calculateFromEqual() {
  //   String finaluserinput = input as String;
  //   finaluserinput = input.replaceAll('x', '*') as String;

  //   Parser p = Parser();
  //   Expression exp = p.parse(finaluserinput);
  //   ContextModel cm = ContextModel();
  //   double eval = exp.evaluate(EvaluationType.REAL, cm);
  //   result = eval.toString() as int;
  // }
}
