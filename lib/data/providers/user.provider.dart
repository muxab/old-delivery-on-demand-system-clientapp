import 'package:client/data/models/user.model.dart';
import 'package:client/statics/apis.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserProvider extends GetConnect {
  final storage = GetStorage();

//Validate User Toekn
  Future<dynamic> validateUser() async {
    var token = await storage.read('token');

    final response = await get(
      '$mainUrl/auth/validate/client',
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.status.hasError) {
      if (response.statusCode == 401 || response.statusCode == 403) {
        storage.write('token', '');
        Get.toNamed('/login');
        return response.statusCode;
      } else {
        storage.write('token', '');
        Get.toNamed('/login');
        Get.snackbar('Error Happend', 'Try Again In Few minutes');
        return response.statusCode;
      }
    } else {
      if (response.statusCode == 200) {
        return response.body['user'];
      } else {
        Get.snackbar('Sorry', 'message');
      }
    }
    // return User.fromJson(user);
  }

  ///
//Login Function
  Future<dynamic> login(Map data) async {
    final response = await post('$mainUrl/auth/login', data);

    if (response.body['status'] == 401) {
      return 401;
    } else {
      if (response.body['token'].isNotEmpty) {
        var token = response.body['token'];
        await storage.write('token', token);

        Get.toNamed('/main');
      } else {
        Get.snackbar('Sorry', 'message');
      }
    }
  }
}
