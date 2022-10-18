import 'package:client/data/models/user.model.dart';
import 'package:client/statics/apis.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterProvider extends GetConnect {
  final storage = GetStorage();

//Validate User Toekn
  Future<dynamic> register(userData) async {
    print('registerni');
    final response = await post(
      '$mainUrl/auth/register',
      userData,
    );

    var token = response.body['token'];
    print(token);
    if (token != null) {
      await storage.write('token', token);

      Get.toNamed('/main');
    } else {
      return response.body;
    }
  }
}
