// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import '../components/component.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var userinput = '';
  var result = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 190),
                  child: Column(
                    children: [
                      Text(
                        userinput.toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        result.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CalculaorBtn(
                              text: "AC",
                              colorr: const Color.fromARGB(255, 91, 87, 89),
                              onpress: (() {
                                userinput = '';
                                result = '';
                                setState(() {});
                              })),
                          CalculaorBtn(
                              text: "+/-",
                              colorr: const Color.fromARGB(255, 91, 87, 89),
                              onpress: (() {
                                userinput += '+/-';
                                setState(() {});
                              })),
                          CalculaorBtn(
                              text: "%",
                              colorr: Colors.pink,
                              onpress: (() {
                                userinput += '%';
                                setState(() {});
                              })),
                          CalculaorBtn(
                              text: "/",
                              colorr: Colors.pink,
                              onpress: (() {
                                userinput += '/';
                                setState(() {});
                              })),
                        ],
                      ),
                      Row(
                        children: [
                          CalculaorBtn(
                              text: "7",
                              onpress: (() {
                                userinput += '7';
                                setState(() {});
                              })),
                          CalculaorBtn(
                              text: "8",
                              onpress: (() {
                                userinput += '8';
                                setState(() {});
                              })),
                          CalculaorBtn(
                              text: "9",
                              onpress: (() {
                                userinput += '9';
                                setState(() {});
                              })),
                          CalculaorBtn(
                              text: "x",
                              colorr: Colors.pink,
                              onpress: (() {
                                userinput += 'x';
                                setState(() {});
                              })),
                        ],
                      ),
                      Row(
                        children: [
                          CalculaorBtn(
                              text: "4",
                              onpress: (() {
                                userinput += '4';
                                setState(() {});
                              })),
                          CalculaorBtn(
                              text: "5",
                              onpress: (() {
                                userinput += '5';
                                setState(() {});
                              })),
                          CalculaorBtn(
                              text: "6",
                              onpress: (() {
                                userinput += '6';
                                setState(() {});
                              })),
                          CalculaorBtn(
                              text: "-",
                              colorr: Colors.pink,
                              onpress: (() {
                                userinput += '-';
                                setState(() {});
                              })),
                        ],
                      ),
                      Row(
                        children: [
                          CalculaorBtn(
                              text: "1",
                              onpress: (() {
                                userinput += '1';
                                setState(() {});
                              })),
                          CalculaorBtn(
                              text: "2",
                              onpress: (() {
                                userinput += '2';
                                setState(() {});
                              })),
                          CalculaorBtn(
                              text: "3",
                              onpress: (() {
                                userinput += '3';
                                setState(() {});
                              })),
                          CalculaorBtn(
                              text: "+",
                              colorr: Colors.pink,
                              onpress: (() {
                                userinput += '+';
                                setState(() {});
                              })),
                        ],
                      ),
                      Row(
                        children: [
                          CalculaorBtn(
                              text: "0",
                              onpress: (() {
                                userinput += '0';
                                setState(() {});
                              })),
                          CalculaorBtn(
                              text: "-",
                              onpress: (() {
                                userinput += '.';
                                setState(() {});
                              })),
                          CalculaorBtn(
                              text: "DEL",
                              onpress: (() {
                                userinput = userinput.substring(
                                    0, userinput.length - 1);
                                setState(() {});
                              })),
                          CalculaorBtn(
                              text: "=",
                              colorr: Colors.pink,
                              onpress: (() {
                                equalPress();
                                setState(() {});
                              })),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  void equalPress() {
    String finaluserinput = userinput;
    finaluserinput = userinput.replaceAll("x", "*");
    Parser p = Parser();
    Expression expression = p.parse(finaluserinput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    result = eval.toString();
  }
}
