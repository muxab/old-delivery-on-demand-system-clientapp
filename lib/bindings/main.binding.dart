import 'package:client/controllers/home.controller.dart';
import 'package:client/controllers/main.controller.dart';
import 'package:client/controllers/profile.controller.dart';
import 'package:client/controllers/shipments.controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<ShipmentsController>(
      () => ShipmentsController(),
    );
  }
}
