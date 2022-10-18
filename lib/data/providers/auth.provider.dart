import 'package:client/statics/apis.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationProvider extends GetConnect {
  final storage = GetStorage();

  Future<dynamic> validateAuth() async {
    var token = await storage.read('token');

    final response = await get('$mainUrl/auth/validate/client', headers: {
      'Authorization': 'Bearer $token',
    });

    if (token == null || token == '') {
      // return {'status_code': 000};
      Get.toNamed('/login');
    }

    if (response.status.hasError) {
      if (response.statusCode == 401) {
        storage.write('token', '');
        Get.snackbar('Not Auth', 'No AUth');
        Get.toNamed('/login');

        // return {'status_code': 401};
      } else if (response.statusCode == 403) {
        storage.write('token', '');
        Get.snackbar('Forbidden', 'Not CLient');
        Get.toNamed('/login');

        return {'status_code': 403};
      }

      // if all cases not applied
    } else {
      // if response is authorized
      if (response.statusCode == 200) {
        Get.toNamed('/main');
        return {'status_code': 200};
      }
    }
  }
}
