import 'package:flutter/material.dart';
import 'package:flutter_calculator_demo/curved_bottom_navigationbar.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new CurvedBottomNavigation(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage(this.title);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";

  String _output = "0";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") {
      num1 = double.parse(output);

      operand = buttonText;

      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Already conatains a decimals");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "X") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0;
      num2 = 0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.green,
            borderRadius: BorderRadius.circular(20),
      ),

        child: FlatButton(
          onPressed: ()=>buttonPressed(buttonText),
          child: Text(buttonText,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
        ),

    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          backgroundColor: Colors.yellow,
          title: new Text(
            'Flexi Calc',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
          ),
        ),
        body: new Container(
            child: new Column(
          children: <Widget>[
            new Container(
                alignment: Alignment.centerRight,
                padding:
                    new EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                child: new Text(output,
                    style: new TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                    ))),
             new Expanded(
               child: new Divider(),
             ),

            new Column(
                children: [
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("/")
              ]),
              SizedBox(height: 10),
              new Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("X")
              ]),SizedBox(height: 10),

              new Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("-")
              ]),SizedBox(height: 10),
              new Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                buildButton("."),
                buildButton("0"),
                buildButton("00"),
                buildButton("+")
              ]),SizedBox(height: 10),
              new Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                buildButton("CLEAR"),
                buildButton("="),
              ]),
              SizedBox(height: 20,)
            ])
          ],
        )));
  }
}
