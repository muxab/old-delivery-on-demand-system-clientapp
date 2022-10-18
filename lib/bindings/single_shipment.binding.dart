import 'package:client/controllers/single_shipment.controller.dart';
import 'package:get/get.dart';

class ShipmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShipmentController>(
      () => ShipmentController(),
    );
  }
}
