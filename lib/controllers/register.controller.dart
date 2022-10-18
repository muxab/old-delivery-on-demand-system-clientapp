import 'package:client/data/providers/register.provider.dart';
import 'package:client/helper/registeration.help.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController conpassword = TextEditingController();

  var counter = 0.obs;

  final formKey = GlobalKey<FormState>();

  var sysError = false.obs;
  // User? user;
  String? usedEmail;

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

  validateEmail(String? value) {
    if (value == null || value.isEmpty || !value.isEmail) {
      return 'الرجاء ادخال ايميل صالح';
    }
  }

  validateName(String? value) {
    if (value == null || value.isEmpty || value.length < 10) {
      return 'الرجاء ادخال اسمك الثنائي';
    }
  }

  validatePhone(String? value) {
    if (value == null ||
        value.isEmpty ||
        !value.isPhoneNumber ||
        value.length < 9) {
      return 'الرجاء ادخال رقم صالح';
    }
  }

  validatePassword(String? value) {
    if (value == null || value == '' || value.length < 3) {
      return 'الرجاء ادخال كلمة سر صالحة';
    }
  }

  validatePasswordCon(String? value) {
    if (value == null || value == '' || value != password.text) {
      return 'كلمة السر والتاكيد غير متطابقين';
    }
  }

  register() {
    var userData = {
      'name': name.text,
      'email': email.text,
      'phone': phone.text,
      'password': password.text,
    };
    RegisterProvider().register(userData);
  }
}
