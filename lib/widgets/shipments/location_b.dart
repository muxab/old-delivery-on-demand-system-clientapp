import 'package:client/controllers/shipments.controller.dart';
import 'package:flutter/material.dart';

class LocationsBlock extends StatelessWidget {
  const LocationsBlock({Key? key, required this.controller, required this.i})
      : super(key: key);

  final ShipmentsController controller;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                controller.shipments[i].origin.city.toString(),
              ),
              Text('الانطلاق'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                controller.shipments[i].destination.city.toString(),
              ),
              Text('الاستلام'),
            ],
          ),
        ],
      ),
    );
  }
}
