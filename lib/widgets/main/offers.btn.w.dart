import 'package:client/controllers/main.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersButton extends StatelessWidget {
  const OffersButton({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final MainController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: RawMaterialButton(
          onPressed: () {
            // controller.naivgate('route');
            Get.toNamed('/offers');
          },
          child: Card(
            elevation: 3,
            child: Container(
              height: 80,
              width: Get.width / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.money),
                    Text('العـروض على الشحنات'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
