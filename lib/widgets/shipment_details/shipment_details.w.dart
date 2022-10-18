import 'package:client/controllers/single_shipment.controller.dart';
import 'package:client/statics/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../general/loading.w.dart';
import 'location_row.w.dart';
import 'more.w.dart';
import 'payment_status.w.dart';
import 'status_chip.w.dart';

class ShipmentDetails extends StatelessWidget {
  const ShipmentDetails({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final ShipmentController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
      child: Column(
        children: [
          darkMediumText('تفـاصيل الرحلة'),
          darkMediumText(controller.shipment!.trackNo.toString()),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            child: Chip(
              elevation: 5,
              backgroundColor: Colors.white,
              // shadowColor: Colors.black,

              label: SizedBox(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StatusChip(
                      status: controller.shipment!.status.toString(),
                    ),
                    // Text('Later')
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: Container(
              height: 500,
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                // border: Border.all(color: Colors.black),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    LocationRow(controller: controller, type: 'origin'),

                    const SizedBox(
                      // height: 30,
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),

                    LocationRow(controller: controller, type: 'destination'),

                    const SizedBox(
                      // height: 30,
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),

                    MoreDetailsRow(
                      controller: controller,
                      type: 'none',
                    ),

                    PayStatus(
                      status: controller.shipment!.status.toString(),
                      phone: controller.driver == null
                          ? ''
                          : controller.driver!.phone.toString(),
                      plate: controller.vehicle == null
                          ? ''
                          : controller.vehicle!.plateNo.toString(),
                      name: controller.driver == null
                          ? ''
                          : controller.driver!.name.toString(),
                    ),

                    cancelShipmentBtn(),

                    /// This [Payment]
                    // Center(
                    //   child: PayButton(
                    //     controller: controller,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding cancelShipmentBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: controller.shipment!.status == 'new'
          ? SizedBox(
              width: Get.width / 2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: () {
                  Get.defaultDialog(
                    radius: 1,
                    title: controller.shipment!.status == 'new'
                        ? 'هل تريد الغــاء الطلب؟'
                        : 'لا يمكنك الغاء الطلب بعد قبول السـائق',
                    content: SizedBox(
                        child: controller.shipment!.status == 'new'
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                    ElevatedButton(
                                        onPressed: () => Get.back(),
                                        child: const Text('لا')),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.red),
                                      onPressed: () =>
                                          controller.cancelShipment(),
                                      child: const Text('نعم'),
                                    ),
                                  ])
                            : Center(
                                child: ElevatedButton(
                                  child: const Text('مـوافق'),
                                  onPressed: () => Get.back(),
                                ),
                              )),
                  );
                },
                child: const Text('إلغـــاء'),
              ),
            )
          : null,
    );
  }
}
