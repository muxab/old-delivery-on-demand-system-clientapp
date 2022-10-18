import 'package:client/controllers/newshipment.controller.dart';
import 'package:client/statics/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreDetails extends StatelessWidget {
  const MoreDetails({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final NewShipmentController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width / 2,
                    height: 50,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: controller.weight,
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                        label: greySmallText('وزن الشحنة '),
                        hintText: 'مثلا : 3 طن',
                        hintTextDirection: TextDirection.rtl,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      // maxLines: 2,
                    ),
                  ),
                  darkSmallText('وزن الشحنة'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width / 2,
                    height: 50,
                    child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.text,
                      controller: controller.shipmentType,
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                        label: greySmallText('نوع الشحنة'),
                        hintText: 'مثلا : قمح .. دقيق',
                        hintTextDirection: TextDirection.rtl,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      // maxLines: 2,
                    ),
                  ),
                  darkSmallText('نوع الشحنة'),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                darkSmallText('تفاصيل اخرى'),
                Container(
                  width: Get.width,
                  height: 70,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: controller.notes,
                    textDirection: TextDirection.rtl,
                    decoration: const InputDecoration(
                      labelText: 'تفاصيل إضافية',
                      focusColor: Colors.red,
                      hintTextDirection: TextDirection.rtl,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    // maxLines: 2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
