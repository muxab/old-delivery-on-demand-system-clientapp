import 'package:get/get.dart';

class NotificationController extends GetxController {
  //TODO: Implement ProfileController
  var not_id = Get.parameters['not_id'];
  var loading = true.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
  void nav(String route) {
    Get.toNamed('/$route');
  }

  void goBack() {
    Get.back();
  }
}
