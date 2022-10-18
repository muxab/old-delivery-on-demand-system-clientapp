import 'package:client/controllers/shipments.controller.dart';
import 'package:client/widgets/shipments/details_b.dart';
import 'package:client/widgets/shipments/location_b.dart';
import 'package:flutter/material.dart';

import 'location_b.dart';
import 'more.w.dart';

class ShipmentsList extends StatelessWidget {
  const ShipmentsList({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ShipmentsController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.shipments.length,
      itemBuilder: (con, i) => Card(
        elevation: 4,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          height: 190,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      controller.shipments[i].trackNo.toString(),
                    ),
                    Text(
                      'رقم الشحنة',
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DetailsBlock(controller: controller, i: i),
                  Text('|'),
                  LocationsBlock(controller: controller, i: i),
                ],
              ),
              ShowMoreBtn(controller: controller, i: i),
            ],
          ),
        ),
      ),
    );
  }
}
