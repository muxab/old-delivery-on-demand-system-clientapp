import 'package:client/controllers/shipments.controller.dart';
import 'package:client/extra/date.function.dart';
import 'package:flutter/material.dart';

class DetailsBlock extends StatelessWidget {
  const DetailsBlock({Key? key, required this.controller, required this.i})
      : super(key: key);

  final ShipmentsController controller;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        // color: Colors.red,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    humanTimeAr(
                      controller.shipments[i].created.toString(),
                    ),
                    // controller.shipments[i].trackNo.toString(),
                  ),
                  Text('جديد'),
                  Text('تم السداد'),
                ],
              ),
            ),
            VerticalDivider(),
          ],
        ),
      ),
    );
  }
}
