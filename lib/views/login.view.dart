// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:client/controllers/login.controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      // ),
      body: WillPopScope(
        onWillPop: () async {
          controller.counter++;
          Future.delayed(Duration(milliseconds: 1000), () {
            controller.counter(0);
          });
          if (controller.counter() == 2) {
            exit(0);
          } else {
            return false;
          }
        },
        child: Obx(
          () => SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height - (Get.height / 3),
                  child: SingleChildScrollView(
                    physics: ClampingScrollPhysics(
                        parent: NeverScrollableScrollPhysics()),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Form(
                                key: controller.formKey,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: controller.email,
                                      validator: (value) {
                                        return controller.validateEmail(value);
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'الايميل',
                                        errorText: controller.loginError.isTrue
                                            ? 'الايميل او كلمة السر خطأ'
                                            : null,
                                        hintTextDirection: TextDirection.rtl,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        hintText: 'كلمة السر',
                                        hintTextDirection: TextDirection.rtl,
                                        errorText: controller.loginError.isTrue
                                            ? 'الايميل او كلمة السر خطأ'
                                            : null,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                      ),
                                      controller: controller.password,
                                      validator: (text) {
                                        return controller
                                            .validatePassword(text);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.indigoAccent,
                                  minimumSize: Size(200, 50)),
                              onPressed: () {
                                // controller.login();
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  // print('object');
                                  controller.login();
                                }

                                // action WHEN values are valid
                              },
                              child: Text('دخـــول'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  child: Text(
                                    'تسجيـل',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  onTap: () {
                                    Get.toNamed('/register');
                                  },
                                ),
                                Text('ما عندك حســاب؟')
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Spacer(),
                // Container(
                //   height: 50,
                //   width: Get.width,
                //   color: Colors.grey,
                //   child: Center(child: Text('ExyPnos Made It For You ❤')),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
