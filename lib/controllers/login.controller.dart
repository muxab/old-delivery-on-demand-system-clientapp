import 'package:client/data/providers/auth.provider.dart';
import 'package:client/data/providers/user.provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  var counter = 0.obs;

  final formKey = GlobalKey<FormState>();

  var sysError = false.obs;
  // User? user;

  @override
  void onClose() {}

  validateEmail(String? value) {
    if (value == null || value.isEmpty || !value.isEmail) {
      return 'الرجاء ادخال ايميل صالح';
    }
  }

  bool isEmail(String? input) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (input == null || input.isEmpty || !regex.hasMatch(input)) {
      return true;
    } else {
      return false;
    }
  }

  validatePassword(String? value) {
    if (value == null || value == '' || value.length < 3) {
      return 'الرجاء ادخال كلمة سر صالحة';
    }
  }

  var loginError = false.obs;
  void login() {
    Map creds = {'email': email.text, 'password': password.text};

    UserProvider().login(creds).then((value) {
      if (value == 401) {
        loginError.value = true;
      }
    }).catchError((_) {});
  }
}
