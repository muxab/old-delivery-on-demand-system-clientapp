import 'package:client/controllers/root.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootView extends GetView<RootController> {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => SafeArea(
        child: controller.loading()
            ? const Center(
                child: CircularProgressIndicator(
                  value: 10,
                  color: Colors.red,
                ),
              )
            : controller.sysError()
                ? Column(
                    children: const [
                      Text('SOrry'),
                    ],
                  )
                : Column(
                    children: [],
                  ),
      ),
    ));
  }
}
