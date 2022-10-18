import 'package:client/controllers/newshipment.controller.dart';
import 'package:get/get.dart';

class NewShipmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewShipmentController>(
      () => NewShipmentController(),
    );
  }
}
