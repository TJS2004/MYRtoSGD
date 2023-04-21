import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exchange Rate Calculator',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/convert': (context) => ConvertScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exchange Rate Calculator',
        style: TextStyle(
            fontFamily: 'Pacifico',
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('images/money.jpg'),
       fit: BoxFit.cover,
        ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Exchange Rate Calculator!',
              style: TextStyle(fontSize: 24,
              color: Colors.white,
              fontFamily: 'Pacifico',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/convert');
              },
              child: Text('Convert Currency'),
            ),
          ],
        ),
      ),
    );
  }
}

class ConvertScreen extends StatefulWidget {

  @override
  _ConvertScreenState createState() => _ConvertScreenState();
}

class _ConvertScreenState extends State<ConvertScreen> {
  double _inputAmount = 0;
  double _outputAmount = 0;

  void _convertCurrency() {
    setState(() {
      _outputAmount = _inputAmount * 0.3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Convert Currency'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Slider(
                value: _inputAmount,
                min: 0,
                max: 1000,
                divisions: 100,
                label: _inputAmount.toStringAsFixed(2),
                onChanged: (value) {
                  setState(() {
                    _inputAmount = value.roundToDouble();
                  });
                },
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _convertCurrency,
                child: Text('Convert'),
              ),
              SizedBox(height: 20),
              Text(
                '$_inputAmount MYR = $_outputAmount SGD',
                style: TextStyle(fontSize: 24),
              ),
              Text('1 Malaysia Ringgit equal to 0.3 Singapore Dollar',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
