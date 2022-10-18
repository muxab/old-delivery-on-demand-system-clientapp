// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:client/controllers/register.controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RegisterView extends GetView<RegisterController> {
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
            Get.back();
            // exit(0);
            return true;
          } else {
            return false;
          }
        },
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 50,
                // child: Text('sd'),
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
                            controller: controller.name,
                            validator: (value) {
                              return controller.validateName(value);
                            },
                            decoration: InputDecoration(
                              hintText: 'الاسم',
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
                            keyboardType: TextInputType.phone,
                            controller: controller.phone,
                            validator: (value) {
                              return controller.validatePhone(value);
                            },
                            decoration: InputDecoration(
                              hintText: 'رقم الهاتف',
                              hintTextDirection: TextDirection.rtl,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: controller.email,
                            validator: (value) {
                              return controller.validateEmail(value);
                            },
                            decoration: InputDecoration(
                              hintText: 'الايميل',
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
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                            ),
                            controller: controller.password,
                            validator: (text) {
                              return controller.validatePassword(text);
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'تأكيد كلمة السر',
                              hintTextDirection: TextDirection.rtl,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                            ),
                            controller: controller.conpassword,
                            validator: (text) {
                              return controller.validatePasswordCon(text);
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
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
                      if (controller.formKey.currentState!.validate()) {
                        controller.register();
                        // print('done');
                      }
                    },
                    child: Text('تسجيـــل'),
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
                          Get.toNamed('/login');
                        },
                      ),
                      Text(' عندك حســاب؟')
                    ],
                  )
                ],
              ),
              // Align(
              //     alignment: Alignment.bottomCenter,
              //     child: Container(
              //       height: 50,
              //       width: Get.width,
              //       color: Colors.grey,
              //       child: Center(child: Text('ExyPnos Made It For You ❤')),
              //     )),
            ],
          ),
        ),
      ),
    );
  }
}
