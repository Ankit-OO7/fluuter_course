import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: IntroPage(),
  ));
}

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          body: Column(
            children: [
              //logo
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Image.asset('lib/images/logo.png'),
              ),
              //we deliver groceries at your doorstep
              const Padding(
                padding: EdgeInsets.all(24.0),
                child: Text(
                  "Eat Green                Stay Healthy",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //fresh items everyday
              const Text(
                  "Fresh items everyday",
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.teal,
                  ),
              ),

              const Spacer(),

              //get started button
              GestureDetector(
                onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomePage();
                      },
                    ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(24),
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}