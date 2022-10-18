import 'package:client/controllers/shipments.controller.dart';
import 'package:get/get.dart';

class ShipmentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShipmentsController>(
      () => ShipmentsController(),
    );
  }
}
