import 'package:flutter/material.dart';
import 'home_page.dart';
import 'fourth_page.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SecondPage(
        selectedVeggies: [], // Pass your selected veggies here
      ),
    ),
  );
}

class SecondPage extends StatefulWidget {
  final List<Map<String, dynamic>> selectedVeggies;

  const SecondPage({Key? key, required this.selectedVeggies}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int currentIndex = 0;
  bool apple = false;
  bool banana = false;
  bool grapes = false;
  bool strawberry = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Center(
            child: Text(
              "F r u t i e s",
              style: TextStyle(
                color: Colors.yellow,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Image.asset(
                'lib/images/fruit.jpg',
                width: 360,
                height:210,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 50,
                color: Colors.white,
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    ' Items               Price/kg',
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 70,
                color: Colors.lightGreen[700],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('lib/images/apple.jpg'),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "  Apple                       Rs. 65",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Checkbox(
                      value: apple,
                      onChanged: (val) {
                        setState(() {
                          apple = val ?? false;
                        });
                      },
                      activeColor: Colors.pink,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 70,
                color: Colors.lightGreen[600],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('lib/images/banana.jpg'),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "  Banana                    Rs. 45",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Checkbox(
                      value: banana,
                      onChanged: (val) {
                        setState(() {
                          banana = val ?? false;
                        });
                      },
                      activeColor: Colors.pink,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 70,
                color: Colors.lightGreen[500],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('lib/images/grapes.jpg'),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "  Grapes                    Rs. 90",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Checkbox(
                      value: grapes,
                      onChanged: (val) {
                        setState(() {
                          grapes = val ?? false;
                        });
                      },
                      activeColor: Colors.pink,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 70,
                color: Colors.lightGreen[400],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('lib/images/strawberry.jpg'),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "  Strawberry             Rs. 99",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Checkbox(
                      value: strawberry,
                      onChanged: (val) {
                        setState(() {
                          strawberry = val ?? false;
                        });
                      },
                      activeColor: Colors.pink,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.green,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const HomePage();
                      },
                    ),
                  );
                },
                child: const Text("Back"),
              ),
              ElevatedButton(
                onPressed: () {
                  // Pass the selected fruits to FourthPage
                  final selectedFruits = [
                    if (apple) {'name': 'Apple', 'price': 65.0},
                    if (banana) {'name': 'Banana', 'price': 45.0},
                    if (grapes) {'name': 'Grapes', 'price': 90.0},
                    if (strawberry) {'name': 'Strawberry', 'price': 99.0},
                  ];

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return FourthPage(
                          selectedVeggies: widget.selectedVeggies,
                          selectedFruits: selectedFruits,
                        );
                      },
                    ),
                  );
                },
                child: const Text("Next"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}