import 'package:flutter/material.dart';
import 'package:get/get.dart';

errorWidget() {
  Get.defaultDialog(
      title: 'خطــأ',
      radius: 2,
      content: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('غير مصــرح لك بالتغيير'),
            Icon(
              Icons.cancel,
              color: Colors.red,
            ),
          ],
        ),
      ));
}

dataExistWidget() {
  Get.defaultDialog(
      title: 'خطــأ',
      radius: 2,
      content: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('البيــانات التي ادخلتها مستخدمة مسبقا'),
            Icon(
              Icons.cancel,
              color: Colors.red,
            ),
          ],
        ),
      ));
}
