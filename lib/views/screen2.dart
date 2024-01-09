import 'package:flutter/material.dart';

class screen2 extends StatelessWidget {
  static const routeName = "/screen2";

  @override
  Widget build(BuildContext context) {
    final argsPassed =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final int index = argsPassed['index'];
    final Color color = argsPassed['color'];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: 7,
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pop(index);
                // Add logic to capture the popped container index and set its color in screen1
              },
              child: Container(
                color: i == index ? color : Colors.grey,
              ),
            );
          },
        ),
      ),
    );
  }
}
