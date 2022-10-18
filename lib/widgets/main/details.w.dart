import 'package:client/controllers/main.controller.dart';
import 'package:client/extra/date.function.dart';
import 'package:client/statics/fonts.dart';
import 'package:client/widgets/shipment_details/status_chip.w.dart';
import 'package:flutter/material.dart';

class DetailsBlock extends StatelessWidget {
  const DetailsBlock({
    Key? key,
    required this.controller,
    required this.i,
    required this.type,
  }) : super(key: key);

  final MainController controller;
  final int i;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        // color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Expanded(
            // flex: 1,
            // child: Column(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            Text(
              humanTimeAr(
                type == 'new'
                    ? controller.newShipments[i].created.toString()
                    : controller.shipments[i].created.toString(),
              ),
              // type == 'new' ? controller.newShipments[i].created.toString() : controller.shipments[i].trackNo.toString(),
            ),
            StatusChip(
              status: type == 'new'
                  ? controller.newShipments[i].status.toString()
                  : controller.shipments[i].status.toString(),
            ),
            // Text('تم السداد'),
            darkSmallText(
              type == 'new'
                  ? controller.newShipments[i].payment.toString()
                  : controller.shipments[i].payment.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
