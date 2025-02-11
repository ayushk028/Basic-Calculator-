import 'package:calculator/mybuttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var questi = '';
  var equall = '';
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '+',
    '7',
    '8',
    '9',
    '-',
    '4',
    '5',
    '6',
    '*',
    '1',
    '2',
    '3',
    '/',
    '00',
    '0',
    '.',
    '='
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f5),
      body: Column(
        children: <Widget>[
          Flexible(
              flex: 3,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 70,
                      width: 250,
                      color: Colors.amberAccent,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          questi,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                ),
              )),
          Flexible(
            flex: 5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: const Color(0xFF80b692),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemCount: 20,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return Mybutton(
                          tap: () {
                            setState(() {
                              questi = '';
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.greenAccent,
                          textColor: Colors.black,
                        );
                      } //delete
                      else if (index == 1) {
                        return Mybutton(
                          tap: () {
                            setState(() {
                              questi = questi.substring(0, questi.length - 1);
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.redAccent,
                          textColor: Colors.black,
                        );
                      } else if (index == 19) {
                        return Mybutton(
                          tap: () {
                            setState(() {
                              anser();
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.blueAccent,
                          textColor: Colors.black,
                        );
                      } else {
                        return Mybutton(
                          tap: () {
                            setState(() {
                              questi += buttons[index];
                            });
                          },
                          buttonText: buttons[index],
                          color: iscalc(buttons[index])
                              ? Colors.blueAccent
                              : Colors.blueGrey.shade50,
                          textColor: Colors.black,
                        );
                      }
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool iscalc(String x) {
    if (x == '%' || x == '/' || x == '*' || x == '+' || x == '-') {
      return true;
    } else {
      return false;
    }
  }

  void anser() {
    String quess = questi;
    Parser p = Parser();
    Expression exp = p.parse(quess);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    int eval2 = eval.toInt();
    questi = eval2.toString();
  }
}
