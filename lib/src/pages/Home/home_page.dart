import 'package:calculator_flutter_app/src/configs/app_route.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100,
              width: screenWidth * 0.6,
              child: RaisedButton(
                color: Colors.red,
                child: const Text('เครื่องคิดเลข',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                onPressed: () => Navigator.pushNamed(context, AppRoute.home),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
