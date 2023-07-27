import 'package:flutter/material.dart';

void main() {
  runApp(PrimeNumberApp());
}

class PrimeNumberApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kiem Tra So Nguyen To',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PrimeNumberScreen(),
    );
  }
}

class PrimeNumberScreen extends StatefulWidget {
  @override
  _PrimeNumberScreenState createState() => _PrimeNumberScreenState();
}

class _PrimeNumberScreenState extends State<PrimeNumberScreen> {
  TextEditingController _numberController = TextEditingController();
  String _resultText = '';

  bool isPrime(int number) {
    if (number <= 1) {
      return false;
    }

    for (int i = 2; i <= number / 2; i++) {
      if (number % i == 0) {
        return false;
      }
    }

    return true;
  }

  void checkPrimeNumber() {
    int? number = int.tryParse(_numberController.text);

    if (number != null) {
      setState(() {
        if (isPrime(number)) {
          _resultText = '$number là số nguyên tố.';
        } else {
          _resultText = '$number không là số nguyên tố.';
        }
      });
    } else {
      setState(() {
        _resultText = 'Vui lòng nhập một số nguyên.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prime Number Checker'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Nhập số',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: checkPrimeNumber,
              child: Text('Kiểm tra'),
            ),
            SizedBox(height: 16.0),
            Text(
              _resultText,
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
