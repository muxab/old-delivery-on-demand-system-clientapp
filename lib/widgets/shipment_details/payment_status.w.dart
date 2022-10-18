import 'package:client/statics/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PayStatus extends StatelessWidget {
  const PayStatus({
    Key? key,
    // required this.controller,
    required this.status,
    this.phone,
    this.plate,
    this.name,
  }) : super(key: key);

  final String? status;
  final String? phone;
  final String? plate;
  final String? name;

  // final ShipmentController controller;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: paymentStatus(status!, phone, plate, name),
    );
  }
}

/// [Status] checking widgets -->
paymentStatus(String status, String? phone, String? plate, String? name) {
  Container statusContainer;

  switch (status) {
    case 'arrived':
      statusContainer = Container(
          height: 50,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.green,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                lightMediumText('تم توصيــل الحمولـــة'),
                const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ],
            ),
          ));
      break;

    case 'onvehicle':
      statusContainer = Container(
        height: 100,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.red,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                lightMediumText('الحمــولة في الطريق'),
                Row(
                  children: [
                    lightSmallText(plate),
                    lightSmallText('رقم اللوحة'),
                  ],
                )
              ],
            ),
            InkWell(
              onTap: () => Get.snackbar('title', 'message'),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                  lightSmallText('اضغط للاتصال')
                ],
              ),
            ),
          ],
        ),
      );
      break;
    case 'pick':
      statusContainer = Container(
          height: 100,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.green,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    lightSmallText('يتم رفع الحمولة على الشـــاحنة'),
                    Row(
                      children: [
                        lightSmallText(plate),
                        lightSmallText('رقم اللوحة'),
                      ],
                    )
                  ],
                ),
                InkWell(
                  onTap: () => Get.snackbar('title', 'message'),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      lightSmallText('اضغط للاتصال')
                    ],
                  ),
                ),
                const Icon(
                  Icons.timer,
                  color: Colors.white,
                ),
              ],
            ),
          ));
      break;

    default:
      statusContainer = Container(
          height: 100,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.redAccent,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    lightMediumText('بانتظار تلقي عروض '),
                    lightSmallText('راجع العروض ووافق على ما يناسبك منها'),
                  ],
                ),
                const Icon(
                  Icons.report,
                  color: Colors.white,
                ),
              ],
            ),
          ));
      break;
  }
  return statusContainer;
}
