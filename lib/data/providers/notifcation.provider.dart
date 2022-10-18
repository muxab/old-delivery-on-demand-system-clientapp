import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../statics/apis.dart';
import '../models/notifcation.model.dart';

class NotificationsProvider extends GetConnect {
  final storage = GetStorage();

  Future<List<dynamic>> getAll() async {
    var token = await storage.read('token');

    final response = await get('$mainUrl/notifications',
        headers: {'Authorization': 'Bearer $token'});

    final notificaions = response.body;

    return notificaions.map((n) => Notification.fromJson(n)).toList();
  }

  Future<dynamic> getSingleNotification(String uuid) async {
    var token = await storage.read('token');

    final response = await get('$mainUrl/notifications/$uuid',
        headers: {'Authorization': 'Bearer $token'});
    final notification = response.body['notification'];
    return Notification.fromJson(notification);
  }
}
