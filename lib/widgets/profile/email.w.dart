import 'package:client/controllers/profile.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';

class EmailCard extends StatelessWidget {
  const EmailCard({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        // onTap: () {},
        title: const Text('تغيير الايميل'),
        trailing: const Icon(Icons.email),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Form(
              key: controller.emailkey,
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: controller.email,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'هذا الحقل مطلوب';
                  } else if (!value.isEmail) {
                    return 'مثلا :: email@email.com';
                  }
                },
                decoration: const InputDecoration(
                  hintText: 'الايميل الجديد',
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
                hintText: 'كلمة السر',
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
              if (controller.emailkey.currentState!.validate()) {
                controller.changeEmail();
              }
            },
            child: const Text('تــأكيد'),
          )
        ],
      ),
    );
  }
}
