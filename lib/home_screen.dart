import 'dart:ffi';

import 'package:calculator/my_buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

var userInput = '';
var answer = '';


class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.brown,
          appBar: AppBar(
            backgroundColor: Colors.deepOrange,
            title: const Text(
              'Calculator',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Column(
            children: [
              
              //Upper Part
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
          child: Text(userInput,style: const TextStyle(color: Colors.white,fontSize: 25,),),
                    ),

                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'Ans= ' + answer,
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(
                color: Colors.white,
              ),
              const SizedBox(
                height: 15,
              ),
              //Lower Part
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        //ROW1
                        children: [
                          MyButton(
                            title: 'Clear',
                            onPress: () {
                              userInput = '';
                              answer = '';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '+/-',
                            onPress: () {
                              userInput += '+/-';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '%',
                            onPress: () {
                              userInput += '%';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '/',
                            color: Colors.deepOrange,
                            onPress: () {
                              userInput += '/';
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        //ROW2
                        children: [
                          MyButton(
                            title: '7',
                            onPress: () {
                              userInput += '7';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '8',
                            onPress: () {
                              userInput += '8';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '9',
                            onPress: () {
                              userInput += '9';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: 'X',
                            color: Colors.deepOrange,
                            onPress: () {
                              userInput += '*';
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        //ROW3
                        children: [
                          MyButton(
                            title: '4',
                            onPress: () {
                              userInput += '4';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '5',
                            onPress: () {
                              userInput += '5';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '6',
                            onPress: () {
                              userInput += '6';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '-',
                            color: Colors.deepOrange,
                            onPress: () {
                              userInput += '-';
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        //ROW4
                        children: [
                          MyButton(
                            title: '1',
                            onPress: () {
                              userInput += '1';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '2',
                            onPress: () {
                              userInput += '2';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '3',
                            onPress: () {
                              userInput += '3';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '+',
                            color: Colors.deepOrange,
                            onPress: () {
                              userInput += '+';
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        //ROW5
                        children: [
                          MyButton(
                            title: 'DEL',
                            onPress: () {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '0',
                            onPress: () {
                              userInput += '0';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '.',
                            onPress: () {
                              userInput += '.';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: 'ANS',
                            color: Colors.green,
                            onPress: () {
                              equalTo();
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void equalTo() {
    Parser p = Parser();
    Expression expression = p.parse(userInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
