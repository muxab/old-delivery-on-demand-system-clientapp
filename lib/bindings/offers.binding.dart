import 'package:client/controllers/offers.controller.dart';
import 'package:get/get.dart';

class OffersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OffersController>(
      () => OffersController(),
    );
  }
}
