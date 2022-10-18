import 'package:flutter/material.dart';
import 'package:get/get.dart';

validateShipmentDiaoug() {
  return Get.defaultDialog(
    title: 'عفــوا',
    content: Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      width: Get.width - 100,
      height: Get.height / 10,
      child: const Center(
        child: Text(" لا يتوفر الشحن الداخلي"),
      ),
    ),
    radius: 5,
    confirm: ElevatedButton(
      onPressed: () {
        Get.back();
      },
      child: const Text('مـوافق'),
    ),
  );
}
