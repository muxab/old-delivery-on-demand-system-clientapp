import 'package:client/controllers/notifications.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../statics/fonts.dart';
import '../widgets/general/loading.w.dart';

class NotificationsView extends GetView<NotificationsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: darkMediumText('الاشعــارات'),
        centerTitle: true,
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
      body: Obx(
        () => controller.sysError()
            ? const Center(
                child: Text('Something Went Wrong'),
              )
            : controller.loading()
                ? const LoadingWidget()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: Get.height - 100,
                        child: ListView.builder(
                            itemCount: controller.notifications.length,
                            itemBuilder: (v, i) {
                              return SizedBox(
                                height: 85,
                                child: Card(
                                  child: Text(controller
                                      .notifications[i].message
                                      .toString()),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
      ),
    );
  }
}
