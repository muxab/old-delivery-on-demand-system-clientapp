import 'package:client/controllers/single_shipment.controller.dart';
import 'package:client/statics/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationRow extends StatelessWidget {
  const LocationRow({
    Key? key,
    required this.controller,
    required this.type,
  }) : super(key: key);
  final ShipmentController controller;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Container(
          //   width: Get.width / 8,
          //   child: darkBigText(type == 'origin'
          //       ? controller.shipment!.origin!.code.toString().toUpperCase()
          //       : controller.shipment!.destination!.code
          //           .toString()
          //           .toUpperCase()),
          // ),
          SizedBox(
            // width: Get.width / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                darkMediumText(type == 'origin'
                    ? controller.shipment!.origin!.city.toString()
                    : controller.shipment!.destination!.city.toString()),
                darkSmallText(type == 'origin'
                    ? controller.shipment!.originAddress.toString()
                    : controller.shipment!.destAddress.toString()),
              ],
            ),
          ),
          SizedBox(
            // width: Get.width / 8,
            child: Center(
              child: darkBigText(
                type == 'origin'
                    ? 'من'.toString().toUpperCase()
                    : 'إلى'.toString().toUpperCase(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
