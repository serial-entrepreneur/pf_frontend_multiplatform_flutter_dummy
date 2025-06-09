import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';


void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String userExp = '';
  String ansExp = '';

  void setNumber(String num) {
    if (num == 'C')
      clearAll();
    else if (num == 'DEL')
      deleteOneChar();
    else
      setState(() {
        userExp += num;
      });
  }

  void deleteOneChar() {
    if (userExp.isNotEmpty) {
      setState(() {
        userExp = userExp.substring(0, userExp.length - 1);
      });
    }
  }

  void clearAll() {
    setState(() {
      userExp = '';
      ansExp = '';
    });
  }
  void calculateResult() {
    try {
      String expression = userExp;
      // Replace '()' with actual parentheses
      expression = expression.replaceAll('()', ''); // or handle properly if you want

      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      setState(() {
        ansExp = eval.toString();
      });
    } catch (e) {
      setState(() {
        ansExp = "Error";
      });
    }
  }


  Widget createButton(String num) {
    return Expanded(
      child: MaterialButton(
        onPressed: () => setNumber(num),
        child: Text(
          num,
          style: TextStyle(
    fontFamily: 'VarelaRound',fontSize: 30.0),
        ),
      ),
    );
  }

  Widget createOprtBtn(String oprt) {
    return Expanded(
      child: MaterialButton(
        onPressed: () => setNumber(oprt),
        child: Text(
          oprt,
          style: TextStyle(
            fontFamily: 'MPLUSRounded1c',
            fontSize: 30.0,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget createRow(
      Widget btn1, Widget btn2, Widget btn3, Widget oprtBtn4) {
    return Row(
      children: <Widget>[
        btn1,
        btn2,
        btn3,
        oprtBtn4,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: AutoSizeText(
              userExp,
              textAlign: TextAlign.right,
              style:TextStyle(
                fontFamily: 'VarelaRound',
                fontSize: 30.0,
                color: Colors.grey[400],
              ),
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: AutoSizeText(
              ansExp,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontFamily: 'VarelaRound',
                fontSize: 30.0,
                color: Colors.grey[400],
              ),
            ),
          ),
        ),
        createRow(createButton('()'), createButton('C'), createButton('DEL'),
            createOprtBtn('/')),
        createRow(createButton('1'), createButton('2'), createButton('3'),
            createOprtBtn('*')),
        createRow(createButton('4'), createButton('5'), createButton('6'),
            createOprtBtn('-')),
        createRow(createButton('7'), createButton('8'), createButton('9'),
            createOprtBtn('+')),
        Row(
          children: <Widget>[
            createButton('0'),
            Expanded(
              child: MaterialButton(
                onPressed: () {
                  calculateResult();
                },
                child: Text(
                  '=',
                  style: TextStyle(
                      fontFamily: 'MPLUSRounded1c',
                      fontSize: 30.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            createButton('.'),
          ],
        ),
      ],
    );
  }
}
