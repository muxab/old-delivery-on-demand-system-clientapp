import 'package:client/controllers/profile.controller.dart';
import 'package:flutter/material.dart';

class PhoneCard extends StatelessWidget {
  const PhoneCard({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        // title: const Icon(Icons.phone),
        // onTap: () {},
        title: const Text('تغيير رقم الهاتف'),
        trailing: const Icon(Icons.phone),
        children: [
          Form(
            key: controller.phoneKey,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: controller.phone,
                validator: (value) {
                  if (value!.length < 9) {
                    return 'الرحاء ادخال رقم هاتف صالح';
                  }
                },
                decoration: const InputDecoration(
                  hintText: 'رقم الهاتف الجديد',
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
                if (value!.length > 4) {
                  return 'الرجاء ادخال كلمة سر صحيحة';
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
              if (controller.phoneKey.currentState!.validate()) {
                controller.changePhone();
              }
            },
            child: const Text('تــأكيد'),
          )
        ],
      ),
    );
  }
}
