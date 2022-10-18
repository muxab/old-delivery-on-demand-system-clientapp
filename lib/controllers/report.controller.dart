import 'package:get/get.dart';

class ReportController extends GetxController {
  //TODO: Implement ReportController
  var serial = Get.parameters['serial'];
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
  void nav(String route) {
    Get.toNamed('/$route');
  }

  void goBack() {
    Get.back();
    Future.delayed(Duration(seconds: 3), () {
      Get.delete<ReportController>();
    });
  }
}
