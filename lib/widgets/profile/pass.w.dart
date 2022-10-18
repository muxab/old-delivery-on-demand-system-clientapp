import 'package:client/controllers/profile.controller.dart';
import 'package:flutter/material.dart';

class PasswordCard extends StatelessWidget {
  const PasswordCard({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: const Text('تغيير كلمة السر'),
        trailing: const Icon(Icons.password),
        children: [
          Form(
            key: controller.passKey,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextFormField(
                controller: controller.newpassword,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'هذا الحقل مطلوب';
                  } else if (value.length < 5) {
                    return 'كلمة السر لا يمكن ان تقل عن 5 احرف';
                  }
                },
                decoration: const InputDecoration(
                  hintText: 'كلمة السر الجديدة',
                  hintTextDirection: TextDirection.rtl,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: TextFormField(
              controller: controller.mainPassword,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'هذا الحقل مطلوب';
                }
              },
              decoration: const InputDecoration(
                hintText: 'كلمة السر القديمة',
                hintTextDirection: TextDirection.rtl,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.passKey.currentState!.validate()) {
                controller.changePassword();
              }
            },
            child: const Text('تــأكيد'),
          )
        ],
      ),
    );
  }
}
