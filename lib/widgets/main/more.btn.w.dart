import 'package:client/controllers/main.controller.dart';
import 'package:client/statics/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowMoreBtn extends StatelessWidget {
  const ShowMoreBtn({Key? key, required this.controller, required this.i})
      : super(key: key);

  final MainController controller;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 1),
        child: RawMaterialButton(
          onPressed: () {
            Get.toNamed('/shipment/${controller.shipments[i].uuid.toString()}');
          },
          elevation: 1,
          focusElevation: 4,
          // shape: RoundedRectangleBorder(),
          child: Container(
            width: Get.width - 10,
            height: 50,
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
            margin: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.indigo),
              // color: Colors.black,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.arrow_back, color: Colors.indigo),
                darkMediumText('عرض التفاصيل'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
