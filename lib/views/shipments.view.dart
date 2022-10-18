import 'package:client/controllers/shipments.controller.dart';
import 'package:client/statics/fonts.dart';
import 'package:client/widgets/general/loading.w.dart';
import 'package:client/widgets/shipments/slst.w.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShipmentsView extends GetView<ShipmentsController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await controller.back();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.indigo),
            onPressed: () {
              controller.back();
            },
          ),
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
        ),
        floatingActionButton: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: Colors.indigo,
          ),
          width: 250,
          height: 60,
          child: RawMaterialButton(
            elevation: 7,
            child: Center(
              child: lightMediumText('إضـافة شحنـــة جديدة'),
            ),
            onPressed: () {
              Get.toNamed("/newshipment");
              // controller.getShipment();
            },
          ),
        ),
        body: Obx(
          () => SafeArea(
            child: controller.loading.value
                ? const LoadingWidget()
                : controller.isEmpty()
                    ? const Center(
                        child: Text('No Shipments'),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 2,
                        ),
                        child: controller.shipments.isEmpty
                            ? Center(
                                child: darkMediumText('/ ليس لديك شحنات مسجلة'),
                              )
                            : ShipmentsList(
                                controller: controller,
                              ),
                      ),
          ),
        ),
      ),
    );
  }
}
