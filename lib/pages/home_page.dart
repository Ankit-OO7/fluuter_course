import 'package:flutter/material.dart';
import 'intro_page.dart';
import 'second_page.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  bool corn = false;
  bool tomato = false;
  bool carrot = false;
  bool cucumber = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Center(
            child: Text(
              "V e g g i e s",
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
                  'lib/images/aveggie.jpg',
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
                      backgroundImage: AssetImage('lib/images/corn.jpg'),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "  Corn                      Rs. 60",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Checkbox(
                      value: corn,
                      onChanged: (val) {
                        setState(() {
                          corn = val ?? false;
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
                      backgroundImage: AssetImage('lib/images/tomato.jpg'),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "  Tomato                 Rs. 30",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Checkbox(
                      value: tomato,
                      onChanged: (val) {
                        setState(() {
                          tomato = val ?? false;
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
                      backgroundImage: AssetImage('lib/images/carrot.jpg'),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "  Carrot                   Rs. 25",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Checkbox(
                      value: carrot,
                      onChanged: (val) {
                        setState(() {
                          carrot = val ?? false;
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
                      backgroundImage: AssetImage('lib/images/cucumber.jpg'),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "  Cucumber           Rs. 35",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Checkbox(
                      value: cucumber,
                      onChanged: (val) {
                        setState(() {
                          cucumber = val ?? false;
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
                  if (currentIndex > 0) {
                    setState(() {
                      currentIndex--;
                    });
                  } else {
                    // Navigate to HomePage when currentIndex is 0
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const IntroPage();
                        },
                      ),
                    );
                  }
                },
                child: const Text("Back"),
              ),
              ElevatedButton(
                onPressed: () {
                  // Pass the selected veggies to SecondPage
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SecondPage(
                          selectedVeggies: [
                            if (corn) {'name': 'Corn', 'price': 60.0},
                            if (tomato) {'name': 'Tomato', 'price': 30.0},
                            if (carrot) {'name': 'Carrot', 'price': 25.0},
                            if (cucumber) {'name': 'Cucumber', 'price': 35.0},
                          ],
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