import 'package:client/data/providers/notifcation.provider.dart';
import 'package:get/get.dart';

class NotificationsController extends GetxController {
  final count = 0.obs;
  var unread = 0.obs;
  var notificationsCuont = 0.obs;
  var loading = false.obs;
  var notifications = List<dynamic>.empty(growable: true).obs;
  var sysError = false.obs;

  @override
  void onInit() {
    super.onInit();
    getNotifications();
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

  getNotifications() {
    loading(true);
    NotificationsProvider().getAll().then(
      (
        v,
      ) {
        notifications(v);
        notifications.map((v) => print('foreach $v'));
        // print(notifications);
        loading(false);
      },
    ).catchError(
      (_) {
        print(_);
        sysError(true);
      },
    );
  }
}
