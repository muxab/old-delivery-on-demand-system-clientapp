import 'package:client/statics/apis.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AccountProvider extends GetConnect {
  final storage = GetStorage();

  Future<dynamic> changPhone(data) async {
    var token = await storage.read('token');

    final response = await post(
      '$mainUrl/account/phone',
      data,
      headers: {'Authorization': 'Bearer $token'},
    );
    return response.body;
  }

  Future<dynamic> changEmail(data) async {
    var token = await storage.read('token');

    final response = await post(
      '$mainUrl/account/email',
      data,
      headers: {'Authorization': 'Bearer $token'},
    );
    return response.body;
  }

  Future<dynamic> changPassword(data) async {
    var token = await storage.read('token');

    final response = await post(
      '$mainUrl/account/password',
      data,
      headers: {'Authorization': 'Bearer $token'},
    );
    return response.body;
  }
}
