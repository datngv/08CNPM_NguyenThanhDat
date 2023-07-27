import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  double a = 0;
  double b = 0;
  double result = 0;

  TextEditingController aController = TextEditingController();
  TextEditingController bController = TextEditingController();

  void calculateResult(String operator) {
    setState(() {
      a = double.parse(aController.text);
      b = double.parse(bController.text);

      switch (operator) {
        case '+':
          result = a + b;
          break;
        case '-':
          result = a - b;
          break;
        case 'x':
          result = a * b;
          break;
        case ':':
          result = a / b;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                  'https://img.icons8.com/?size=512&id=113570&format=png',
                  width: 200,
                  height: 200              ),
              SizedBox(height: 16.0),
              TextField(
                controller: aController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Nhập số a',
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: bController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Nhập số b',
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Kết quả: $result',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => calculateResult('+'),
                    child: Text('+'),
                  ),
                  ElevatedButton(
                    onPressed: () => calculateResult('-'),
                    child: Text('-'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // Màu đỏ cho nút '+'
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => calculateResult('x'),
                    child: Text('x'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // Màu đỏ cho nút '+'
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => calculateResult(':'),
                    child: Text(':'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange, // Màu đỏ cho nút '+'
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
