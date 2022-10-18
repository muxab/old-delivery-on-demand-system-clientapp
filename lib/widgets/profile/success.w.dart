import 'package:flutter/material.dart';
import 'package:get/get.dart';

successWidget() {
  Get.defaultDialog(
      radius: 2,
      title: 'شكـــرا',
      content: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('تــم'),
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          ],
        ),
      ));
}
