import 'package:calculator/Component/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var userInput = '';
  var Result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.02),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              userInput.toString(),
                              style: const TextStyle(
                                  fontSize: 30, color: Colors.white),
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          Result.toString(),
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            MyButton(
                              title: 'AC',
                              onpress: () {
                                userInput = '';
                                Result = ' ';
                                setState(() {});
                              },
                            ),
                            MyButton(
                                title: '+/-',
                                onpress: () {
                                  userInput += '+/-';
                                  setState(() {});
                                }),
                            MyButton(
                                title: '%',
                                onpress: () {
                                  userInput += '%';
                                  setState(() {});
                                }),
                            MyButton(
                                title: '/',
                                btnColor: const Color(0xffffa00a),
                                onpress: () {
                                  userInput += '/';
                                  setState(() {});
                                })
                          ],
                        ),
                        Row(
                          children: [
                            MyButton(
                              title: '7',
                              onpress: () {
                                userInput += '7';
                                setState(() {});
                              },
                            ),
                            MyButton(
                                title: '8',
                                onpress: () {
                                  userInput += '8';
                                  setState(() {});
                                }),
                            MyButton(
                                title: '9',
                                onpress: () {
                                  userInput += '9';
                                  setState(() {});
                                }),
                            MyButton(
                                title: 'x',
                                btnColor: const Color(0xffffa00a),
                                onpress: () {
                                  userInput += 'x';
                                  setState(() {});
                                })
                          ],
                        ),
                        Row(
                          children: [
                            MyButton(
                              title: '4',
                              onpress: () {
                                userInput += '4';
                                setState(() {});
                              },
                            ),
                            MyButton(
                                title: '5',
                                onpress: () {
                                  userInput += '5';
                                  setState(() {});
                                }),
                            MyButton(
                                title: '6',
                                onpress: () {
                                  userInput += '6';
                                  setState(() {});
                                }),
                            MyButton(
                                title: '-',
                                btnColor: const Color(0xffffa00a),
                                onpress: () {
                                  userInput += '-';
                                  setState(() {});
                                })
                          ],
                        ),
                        Row(
                          children: [
                            MyButton(
                              title: '1',
                              onpress: () {
                                userInput += '1';
                                setState(() {});
                              },
                            ),
                            MyButton(
                                title: '2',
                                onpress: () {
                                  userInput += '2';
                                  setState(() {});
                                }),
                            MyButton(
                                title: '3',
                                onpress: () {
                                  userInput += '3';
                                  setState(() {});
                                }),
                            MyButton(
                                title: '+',
                                btnColor: const Color(0xffffa00a),
                                onpress: () {
                                  userInput += '+';
                                  setState(() {});
                                })
                          ],
                        ),
                        Row(
                          children: [
                            MyButton(
                              title: '0',
                              onpress: () {
                                userInput += '0';
                                setState(() {});
                              },
                            ),
                            MyButton(
                                title: '.',
                                onpress: () {
                                  userInput += '.';
                                  setState(() {});
                                }),
                            MyButton(
                                title: 'DEL',
                                onpress: () {
                                  userInput = userInput.substring(
                                      0, userInput.length - 1);
                                  setState(() {});
                                }),
                            MyButton(
                                title: '=',
                                btnColor: const Color(0xffffa00a),
                                onpress: () {
                                  equalPress();
                                  setState(() {});
                                  setState(() {});
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void equalPress() {
    String FinalUserS = userInput;
    FinalUserS = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(FinalUserS);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    Result = eval.toString();
  }
}
