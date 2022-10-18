import 'package:client/controllers/notification.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationView extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.indigo,
          ),
          onPressed: () {
            controller.goBack();
          },
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      body: SafeArea(
          child: Center(
        child: Text('Notifications'),
      )),
    );
  }
}
