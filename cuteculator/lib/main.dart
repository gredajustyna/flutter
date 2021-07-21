import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'Yomogi',
    ),
    home: Calculator(),
  ));
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String input = '';
  String result = '';
  String memory = '';

  //division =1, multiplication = 2, addition = 3, subtraction = 4, percentage = 5,
  int currentOperation = 0;

  double firstNumber = 0;
  double secondNumber = 0;

  int operationPosition = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          SizedBox(height: 80),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
                  '$input',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.pink[300],
                    fontSize: 40,
                    ),
                  ),
          ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(
                '$result',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                  color: Colors.pink[200],
                  fontSize: 30,
                  ),
                ),
            ),
          SizedBox(height: 90),
          Row(
            children: <Widget>[
              RawMaterialButton(
                  onPressed: (){
                    setState(() {
                      input = '';
                      result = '';
                    });
                    currentOperation = 0;
                    operationPosition = -1;
                    firstNumber = 0;
                    secondNumber = 0;
                  },
                elevation: 2.0,
                fillColor: Colors.pink[200],
                child: Text(
                  'C',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              RawMaterialButton(
                onPressed: (){
                  if(currentOperation ==0 && input.length<13){
                    currentOperation = 1;
                    firstNumber = double.parse(input);
                    setState(() {
                      input = input + '÷';
                    });
                    operationPosition = input.length;
                  }
                  else if(input.length>=10){
                    setState(() {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content:
                      Text(
                          "Input too long!")
                      ));
                    });
                  }
                },
                elevation: 2.0,
                fillColor: Colors.pink[200],
                child: Text(
                  '÷',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              RawMaterialButton(
                onPressed: (){
                  if(currentOperation ==0 && input.length<13){
                    currentOperation = 2;
                    firstNumber = double.parse(input);
                    setState(() {
                      input = input + '×';
                    });
                    operationPosition = input.length;
                  }else if(input.length>=10){
                    setState(() {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content:
                      Text(
                          "Input too long!")
                      ));
                    });
                  }
                },
                elevation: 2.0,
                fillColor: Colors.pink[200],
                child: Text(
                  '×',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              RawMaterialButton(
                onPressed: (){
                  if(input.endsWith('+') || input.endsWith('-') || input.endsWith('%') || input.endsWith('÷') || input.endsWith('×')){
                    currentOperation = 0;
                  }
                  setState(() {
                    input = input.substring(0, input.length-1);
                  });
                  firstNumber = double.parse(input);
                },
                elevation: 2.0,
                fillColor: Colors.pink[200],
                child: Icon(
                  Icons.backspace,
                  color: Colors.white,
                  ),
                padding: EdgeInsets.all(24.0),
                shape: CircleBorder(),
                ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              RawMaterialButton(
                onPressed: (){
                  if(input.length<15){
                    setState(() {
                      input = input + '7';
                    });
                  }
                },
                elevation: 2.0,
                fillColor: Colors.pink[300],
                child: Text(
                  '7',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              RawMaterialButton(
                onPressed: (){
                  if(input.length<15){
                    setState(() {
                      input = input + '8';
                    });
                  }
                },
                elevation: 2.0,
                fillColor: Colors.pink[300],
                child: Text(
                  '8',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              RawMaterialButton(
                onPressed: (){
                  if(input.length < 15){
                    setState(() {
                      input = input + '9';
                    });
                  }
                },
                elevation: 2.0,
                fillColor: Colors.pink[300],
                child: Text(
                  '9',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              RawMaterialButton(
                onPressed: (){
                  if(input.length<13 && currentOperation ==0){
                    currentOperation = 4;
                    firstNumber = double.parse(input);
                    setState(() {
                      input = input + '-';
                    });
                    operationPosition = input.length;
                  }else if(input.length>=10){
                    setState(() {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content:
                      Text(
                          "Input too long!")
                      ));
                    });
                  }
                },
                elevation: 2.0,
                fillColor: Colors.pink[200],
                child: Text(
                  '-',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              RawMaterialButton(
                onPressed: (){
                  setState(() {
                    input = input + '4';
                  });
                },
                elevation: 2.0,
                fillColor: Colors.pink[300],
                child: Text(
                  '4',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              RawMaterialButton(
                onPressed: (){
                  setState(() {
                    input = input + '5';
                  });
                },
                elevation: 2.0,
                fillColor: Colors.pink[300],
                child: Text(
                  '5',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              RawMaterialButton(
                onPressed: (){
                  setState(() {
                    input = input + '6';
                  });
                },
                elevation: 2.0,
                fillColor: Colors.pink[300],
                child: Text(
                  '6',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              RawMaterialButton(
                onPressed: (){
                  if(currentOperation ==0 && input.length<13){
                    currentOperation = 3;
                    firstNumber = double.parse(input);
                    setState(() {
                      input = input + '+';
                    });
                    operationPosition = input.length;
                  }
                  else if(input.length>=10){
                    setState(() {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content:
                      Text(
                          "Input too long!")
                      ));
                    });
                  }
                },
                elevation: 2.0,
                fillColor: Colors.pink[200],
                child: Text(
                  '+',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              RawMaterialButton(
                onPressed: (){
                  setState(() {
                    input = input + '1';
                  });
                },
                elevation: 2.0,
                fillColor: Colors.pink[300],
                child: Text(
                  '1',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              RawMaterialButton(
                onPressed: (){
                  setState(() {
                    input = input + '2';
                  });
                },
                elevation: 2.0,
                fillColor: Colors.pink[300],
                child: Text(
                  '2',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              RawMaterialButton(
                onPressed: (){
                  setState(() {
                    input = input + '3';
                  });
                },
                elevation: 2.0,
                fillColor: Colors.pink[300],
                child: Text(
                  '3',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              RawMaterialButton(
                onPressed: () {
                  if (currentOperation ==0) {
                    if(input.isEmpty){
                      setState(() {
                        input = input + memory;
                      });
                    }else{
                      memory = input;
                    }
                  } else {
                    print(result);
                    setState(() {
                      input = input + memory;
                    });

                  }

                },
                elevation: 2.0,
                fillColor: Colors.pink[200],
                child: Text(
                  'M',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              RawMaterialButton(
                onPressed: (){
                  if(currentOperation ==0 && input.length<13){
                    currentOperation = 5;
                    firstNumber = double.parse(input);
                    setState(() {
                      input = input + '%';
                    });
                    operationPosition = input.length;
                  }
                  else if(input.length>=10){
                    setState(() {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content:
                      Text(
                          "Input too long!")
                      ));
                    });
                  }
                },
                elevation: 2.0,
                fillColor: Colors.pink[300],
                child: Text(
                  '%',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              RawMaterialButton(
                onPressed: (){
                  if(input.length>0 && input.length<10){
                    setState(() {
                      input = input + '0';
                    });
                  }else if(input.length==0){
                    setState(() {
                      input = input + '0.';
                    });
                  }
                },
                elevation: 2.0,
                fillColor: Colors.pink[300],
                child: Text(
                  '0',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              RawMaterialButton(
                onPressed: (){
                  if(input.length>0 && input.length<10 && !input.contains(".")){
                    setState(() {
                      input = input + '.';
                    });
                  }else if(input.length>=10){
                    setState(() {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content:
                      Text(
                          "Input too long!")
                      ));
                    });
                  }
                },
                elevation: 2.0,
                fillColor: Colors.pink[300],
                child: Text(
                  '.',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              RawMaterialButton(
                onPressed: (){
                  result = setResult().toString();
                  if(result.endsWith('.0')){
                    result = result.substring(0,result.length-2);
                  }
                  setState(() {
                    input = result;
                  });
                  currentOperation = 0;
                  operationPosition = -1;
                  firstNumber = double.parse(result);
                  secondNumber = 0;
                },
                elevation: 2.0,
                fillColor: Colors.pink[700],
                child: Text(
                  '=',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  double setResult(){
    secondNumber = double.parse(input.substring(operationPosition,input.length));
    switch(currentOperation){
      case(1):
        if((firstNumber/secondNumber).toString().length<15){
          return (firstNumber/secondNumber);
        }else{
          if((firstNumber/secondNumber).toString().contains('.') && (firstNumber/secondNumber).toString().indexOf('.')<14){
            String res = (firstNumber/secondNumber).toString().substring(0,15);
            return double.parse(res);
          }else{
            return 999999999;
          }
        }
        break;
      case(2):
        if((firstNumber*secondNumber).toString().length<15){
          return (firstNumber*secondNumber);
        }else{
          if((firstNumber*secondNumber).toString().contains('.') && (firstNumber/secondNumber).toString().indexOf('.')<14){
            String res = (firstNumber*secondNumber).toString().substring(0,15);
            return double.parse(res);
          }else{
            return 999999999;
          }
        }
      case(3):
        if((firstNumber+secondNumber).toString().length<15){
          return (firstNumber+secondNumber);
        }else {
          if ((firstNumber + secondNumber).toString().contains('.') &&
              (firstNumber + secondNumber).toString().indexOf('.') < 14) {
            String res = (firstNumber + secondNumber).toString().substring(
                0, 15);
            return double.parse(res);
          } else {
            return 999999999;
          }
        }
      case(4):
        if((firstNumber-secondNumber).toString().length<15){
          return (firstNumber-secondNumber);
        }else {
          if ((firstNumber - secondNumber).toString().contains('.') &&
              (firstNumber - secondNumber).toString().indexOf('.') < 14) {
            String res = (firstNumber - secondNumber).toString().substring(
                0, 15);
            return double.parse(res);
          } else {
            return -999999999;
          }
        }
      case(5):
        double resu = (firstNumber/100)*secondNumber;
        if((resu).toString().length<15){
          return (resu);
        }else {
          if ((resu).toString().contains('.') &&
              (resu).toString().indexOf('.') < 14) {
            String res = (resu).toString().substring(
                0, 15);
            return double.parse(res);
          } else {
            return 999999999;
          }
        }
    }
    return firstNumber;
  }
}
