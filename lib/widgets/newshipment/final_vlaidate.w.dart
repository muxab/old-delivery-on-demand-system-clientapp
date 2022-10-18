import 'package:client/controllers/newshipment.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

finalValidateCard(
  data,
) {
  return Get.defaultDialog(
    title: 'تحقـق',
    content: Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      width: Get.width - 100,
      height: Get.height / 2,
      child: SingleChildScrollView(
        child: Column(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('مكان رفع الشحنة'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(data['origin_address']),
                    Text(data['origin']),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: Get.width / 2,
              child: const Divider(),
              height: 20,
            ),
            Column(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('مكان توصيل الشحنة'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(data['dest_address']),
                    Text(data['destination']),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: Get.width / 2,
              child: const Divider(),
              height: 20,
            ),
            Column(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(data['type_s']),
                    const Text('نوع الشحنة'),
                  ],
                ),
                const VerticalDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(data['weight']),
                    const Text('وزن الشحنة *بالطن'),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('ستتلقى عروضا '),
              ],
            ),
          ],
        ),
      ),
    ),
    radius: 5,
    barrierDismissible: false,
    confirm: ElevatedButton(
      onPressed: () {
        NewShipmentController().addShipment(data);
        Get.back();
        // NewShipmentController().addShipment(data);
      },
      child: const Text('مـوافق'),
    ),
    cancel: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
      ),
      onPressed: () {
        Get.back();
      },
      child: const Text('إلـغاء'),
    ),
  );
}
