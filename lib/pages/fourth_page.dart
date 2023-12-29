import 'package:flutter/material.dart';
import 'intro_page.dart';

class FourthPage extends StatefulWidget {
  final List<Map<String, dynamic>> selectedVeggies;
  final List<Map<String, dynamic>> selectedFruits;

  const FourthPage({
    Key? key,
    required this.selectedVeggies,
    required this.selectedFruits,
  }) : super(key: key);

  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  int currentIndex = 0;

  double calculateTotalAmount() {
    double totalAmount = 0.0;

    for (var item in widget.selectedVeggies) {
      totalAmount += (item['price'] as double);
    }

    for (var item in widget.selectedFruits) {
      totalAmount += (item['price'] as double);
    }

    return totalAmount;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Padding(
            padding: EdgeInsets.only(right: 55), // Adjust the top padding as needed
            child: Center(
              child: Text(
                "Pay the Bill",
                style: TextStyle(
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop(); // Go back to the previous page
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "Selected Veggies:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  for (var item in widget.selectedVeggies)
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('lib/images/${item['name'].toLowerCase()}.jpg'),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "${item['name']} - Rs. ${item['price']}",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "Selected Fruits:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  for (var item in widget.selectedFruits)
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('lib/images/${item['name'].toLowerCase()}.jpg'),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "${item['name']} - Rs. ${item['price']}",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Total Amount: Rs. ${calculateTotalAmount()}",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Image.asset(
                'lib/images/happy.png', // Replace with your image path
                height: 82, // Adjust the height as needed
                width: 200, // Adjust the width as needed
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        //BODY
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
                    // Navigate to IntroPage when currentIndex is 0
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
                child: const Text("Home"),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate to E-Pay or next page logic
                },
                child: const Text("E-Pay"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
