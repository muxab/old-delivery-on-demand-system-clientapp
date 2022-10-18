import 'package:client/controllers/single_shipment.controller.dart';
import 'package:client/widgets/general/loading.w.dart';
import 'package:client/widgets/shipment_details/shipment_details.w.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:client/statics/fonts.dart';

class ShipmentView extends GetView<ShipmentController> {
  const ShipmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: () async {
          Get.offAndToNamed('/main');
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.indigo,
              ),
              onPressed: () {
                controller.navigate();
              },
            ),
            toolbarHeight: 56,
            shadowColor: Colors.black,
            backgroundColor: Colors.white,
          ),
          body: controller.sysError()
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    darkMediumText(
                      'حـــدث خطـــأ ما ',
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.refresh),
                    ),
                  ],
                )
              : controller.loading.isTrue
                  ? const LoadingWidget()
                  : ShipmentDetails(
                      controller: controller,
                    ),
        ),
      ),
    );
  }
}
