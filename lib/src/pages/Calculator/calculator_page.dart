import 'package:calculator_flutter_app/src/pages/Calculator/widgets/cal_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  var input = '';
  var result = '';
  // Array of button
  final List<String> calButtons = [
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
                flex: 1,
                child: Container(
                    child: Column(children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.centerRight,
                    child: Text(
                      input,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      result,
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
                ]))),
            Expanded(
                flex: 3,
                child: Container(
                    child: GridView.builder(
                        itemCount: calButtons.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4),
                        itemBuilder: (BuildContext context, int index) {
                          // For Clearing the Button
                          if (index == 0) {
                            return CalculatorButton(
                              buttonTapped: () {
                                setState(() {
                                  input = '';
                                  result = '0';
                                });
                              },
                              textButton: calButtons[index],
                              color: Colors.blue[50],
                              colorText: Colors.black,
                            );
                          } else if (index == 1) {
                            return CalculatorButton(
                              textButton: calButtons[index],
                              color: Colors.blue[50],
                              colorText: Colors.black,
                            );
                          } else if (index == 2) {
                            return CalculatorButton(
                              buttonTapped: () {
                                setState(() {
                                  input += calButtons[index];
                                });
                              },
                              textButton: calButtons[index],
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
                              textButton: calButtons[index],
                              color: Colors.blue[50],
                              colorText: Colors.black,
                            );
                          } else if (index == 18) {
                            return CalculatorButton(
                              buttonTapped: () {
                                setState(() {
                                  calculateFromEqual();
                                });
                              },
                              textButton: calButtons[index],
                              color: Colors.blue[50],
                              colorText: Colors.black,
                            );
                          } else {
                            return CalculatorButton(
                              buttonTapped: () {
                                setState(() {
                                  input += calButtons[index];
                                });
                              },
                              textButton: calButtons[index],
                              color: operatorVerify(calButtons[index])
                                  ? Colors.blueAccent
                                  : Colors.white,
                              colorText: operatorVerify(calButtons[index])
                                  ? Colors.white
                                  : Colors.black,
                            );
                          }
                        })))
          ],
        ));
  }

  bool operatorVerify(String sign) {
    if (sign == '/' ||
        sign == 'x' ||
        sign == '-' ||
        sign == '+' ||
        sign == '=') {
      return true;
    }
    return false;
  }

  // the function that calculate the result
  void calculateFromEqual() {
    String finaluserinput = input;
    finaluserinput = input.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    result = eval.toString();
  }
}
