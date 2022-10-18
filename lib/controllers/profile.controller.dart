import 'package:client/data/providers/account.provider.dart';
import 'package:client/widgets/profile/error.w.dart';
import 'package:client/widgets/profile/success.w.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  final storage = GetStorage();

  final GlobalKey<FormState> phoneKey = GlobalKey<FormState>();
  final GlobalKey<FormState> emailkey = GlobalKey<FormState>();
  final GlobalKey<FormState> passKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController mainPassword = TextEditingController();

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

  void goBack() {
    Get.back();
  }

  changePhone() {
    var data = {'newPhone': phone.text, 'password': mainPassword.text};

    AccountProvider().changPhone(data).then((value) {
      if (value['stauts'] == 401) {
        errorWidget();
      } else if (value['status'] == 406) {
        dataExistWidget();
      } else {
        successWidget();
        phone.text = '';
        mainPassword.text = '';
      }
    });
  }

  changeEmail() {
    var data = {'newEmail': email.text, 'password': mainPassword.text};

    AccountProvider().changEmail(data).then((value) {
      if (value['stauts'] == 401) {
        errorWidget();
      } else if (value['status'] == 406) {
        dataExistWidget();
      } else {
        successWidget();

        email.text = '';
        mainPassword.text = '';
      }
    });
  }

  changePassword() {
    var data = {'newPassword': newpassword.text, 'password': mainPassword.text};

    AccountProvider().changPassword(data).then((value) {
      if (value['stauts'] == 401) {
        errorWidget();
      } else {
        successWidget();

        newpassword.text = '';
        mainPassword.text = '';
      }
    });
  }

  void logout() {
    // Get The Token ..
    // Send to api

    //unsigned from api

    Get.deleteAll();

    Get.toNamed('/login');

    // delete the token
    storage.remove('token');

    // leave to root
  }
}
