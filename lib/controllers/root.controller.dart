import 'package:client/data/providers/auth.provider.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  var loading = true.obs;
  var sysError = false.obs;

  @override
  void onInit() {
    super.onInit();
    validateToken();
    // loading(false);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  validateToken() {
    loading(true);

    AuthenticationProvider().validateAuth().then((value) {
      Future.delayed(const Duration(seconds: 3), () {
        loading(false);
      });
    }).catchError((_) {
      sysError(true);
    });
  }
}
