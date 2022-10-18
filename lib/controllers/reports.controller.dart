import 'package:get/get.dart';

class ReportsController extends GetxController {
  //TODO: Implement ReportController
  var loading = false.obs;

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

  void goBack() {
    Get.back();
  }
}
