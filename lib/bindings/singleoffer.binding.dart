import 'package:client/controllers/singleoffer.controller.dart';
import 'package:get/get.dart';

class SingleOfferBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SingleOfferController>(
      () => SingleOfferController(),
    );
  }
}
