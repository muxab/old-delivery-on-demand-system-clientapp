import 'package:client/statics/apis.dart';
import 'package:get/get.dart';

class UserRegisterHelper extends GetConnect {
  Future<dynamic> checkExistance(checker) async {
    final response = await post('$mainUrl/auth/existance', checker);

    if (response.statusCode == 400) {
      checker['type'] == 'email'
          ? Get.snackbar('عفــوا', 'الايميل مستخدم')
          : Get.snackbar('عفــوا', 'الرقم مستخدم');
      // return 'new';
    }
  }
}
