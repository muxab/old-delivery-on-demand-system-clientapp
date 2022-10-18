import 'package:client/controllers/main.controller.dart';
import 'package:client/statics/fonts.dart';
import 'package:client/statics/fonts.dart';
import 'package:client/widgets/main/details.w.dart';
import 'package:client/widgets/main/location.w.dart';
import 'package:client/widgets/main/more.btn.w.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShipmentsList extends StatelessWidget {
  const ShipmentsList({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final MainController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: controller.shipments.length,
        itemBuilder: (con, i) {
          return Container(
            height: 100,
            child: Card(
              elevation: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          darkMediumText(
                            controller.shipments[i].origin.city.toString(),
                          ),
                          darkMediumText(
                            controller.shipments[i].destination.city.toString(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text('dsdsds'),
                  Icon(Icons.keyboard_arrow_right_sharp),
                ],
              ),
            ),
          );
        });
  }
}

class MainShipmentsList extends StatelessWidget {
  const MainShipmentsList({
    Key? key,
    required this.controller,
    required this.type,
  }) : super(key: key);

  final MainController controller;
  final String type;

  @override
  Widget build(BuildContext context) {
    // return Scrollbar(
    //   isAlwaysShown: true,
    //   controller: ScrollController(),
    // child:
    return ListView.builder(
      /// if type is [New]  widgets .. take from newShipment list else use shipments array
      itemCount: type == 'new'
          ? controller.newShipments.length
          : controller.shipments.length,
      itemBuilder: (con, i) => Card(
        elevation: 4,
        child: GestureDetector(
          onTap: () {
            type == 'new'
                ? Get.toNamed(
                    '/shipment/${controller.newShipments[i].uuid.toString()}',
                  )
                : Get.toNamed(
                    '/shipment/${controller.shipments[i].uuid.toString()}',
                  );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  //Add INkwell and navigate to shipment detail using uuid ,,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SelectableText(
                              type == 'new'
                                  ? controller.newShipments[i].trackNo
                                      .toString()
                                  : controller.shipments[i].trackNo.toString(),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(CupertinoIcons.doc_on_clipboard_fill),
                            ),
                          ]),
                      Text(
                        'رقم الشحنة',
                      ),
                    ],
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                DetailsBlock(
                  controller: controller,
                  i: i,
                  type: type,
                ),
                // Text('|'),
                // LocationsBlock(controller: controller, i: i),
                //   ],
                // ),
                // ShowMoreBtn(controller: controller, i: i),
              ],
            ),
          ),
        ),
      ),
      // ),
    );
  }
}

class EmptyShipmentsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        height: 100,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
              ),
              child: darkMediumText('ليس لديك شحنات '),
            ),
            Center(
              child: RawMaterialButton(
                onPressed: () {
                  Get.toNamed('/newshipment');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(Icons.arrow_back_ios),
                    darkMediumText('إضـافة شحنة '),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
