import 'package:flutter/material.dart';

import 'screen2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: screen1.routeName,
      routes: {
        screen1.routeName: (context) => screen1(),
        screen2.routeName: (context) => screen2(),
      },
    );
  }
}
class screen1 extends StatefulWidget {
  static const routeName = "/screen1";

  @override
  _screen1State createState() => _screen1State();
}

class _screen1State extends State<screen1> {
  List<Color> boxColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  bool buttonClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: boxColors.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                if (!buttonClicked) {
                  buttonClicked = true;
                  final result = await Navigator.pushNamed(
                    context,
                    screen2.routeName,
                    arguments: {
                      'index': index,
                      'color': boxColors[index],
                    },
                  );
                  // Handle the result here, e.g., update the color of the popped container.
                  if (result != null && result is int) {
                    // Update the color of the popped container at the specified index.
                    boxColors[result] = Colors.grey; // Change this based on your logic.
                    setState(() {});
                  }
                  buttonClicked = false; // Reset the buttonClicked flag.
                }
              },
              child: Container(
                color: buttonClicked ? Colors.grey : boxColors[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
