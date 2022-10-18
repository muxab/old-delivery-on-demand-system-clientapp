import 'package:client/controllers/main.controller.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final MainController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              controller.naivgate(1);
            },
            icon: Icon(Icons.star),
          ),
          IconButton(
            onPressed: () {
              controller.naivgate(0);
            },
            icon: Icon(Icons.home),
          ),
          IconButton(
            onPressed: () {
              controller.naivgate(2);
            },
            icon: Icon(Icons.car_rental),
          ),
        ],
      ),
    );
  }
}
