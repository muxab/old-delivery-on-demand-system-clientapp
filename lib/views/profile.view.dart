import 'package:client/controllers/profile.controller.dart';
import 'package:client/widgets/profile/email.w.dart';
import 'package:client/widgets/profile/pass.w.dart';
import 'package:client/widgets/profile/phone.w.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../statics/fonts.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.indigo,
          ),
          onPressed: () {
            controller.goBack();
          },
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      body: SafeArea(
        child: SizedBox(
          height: Get.height,
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              PhoneCard(
                controller: controller,
              ),

              const Divider(),
              EmailCard(controller: controller),

              const Divider(),
              PasswordCard(
                controller: controller,
              ),

              // const Spacer(),
              const SizedBox(
                height: 200,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Card(
                  elevation: 2,
                  child: ListTile(
                    trailing: const Text('تسجيــل الخروج'),
                    leading: const Icon(
                      Icons.logout,
                      textDirection: TextDirection.rtl,
                    ),
                    onTap: () {
                      controller.logout();
                    },
                  ),
                ),
              ),
              // const Spacer(),
              const SizedBox(
                height: 200,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                // color: Colors.red,
                child: greySmallText('EXY'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
