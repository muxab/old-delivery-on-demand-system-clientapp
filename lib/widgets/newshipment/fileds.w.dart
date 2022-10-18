import 'package:client/controllers/newshipment.controller.dart';
import 'package:client/data/models/v_type.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

import 'selector.w.dart';
import 'moredetails.w.dart';

class NewShipmentFileds extends StatelessWidget {
  const NewShipmentFileds({Key? key, required this.controller})
      : super(key: key);
  final NewShipmentController controller;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: Get.height,
        padding: EdgeInsets.only(bottom: 40),
        // padding: EdgeInsets.only(bottom: 120),
        child: ListView(
          // scrollDirection: Axis.vertical,
          children: [
            CityPickWidget(
              controller: controller,
              // text: controller.toExtra,
              title: 'عنوان رفع الشحنة',
              codeLocation: controller.originLocation(),
              // valueChanger: controller.toSelectorValue,
              type: 'origin',
            ),
            CityPickWidget(
              controller: controller,
              // text: controller.fromExtra,
              title: 'عنوان توصيل الشحنة',
              codeLocation: controller.destinationLocation(),
              // valueChanger: controller.toSelectorValue,
              type: 'destination',
            ),
            MoreDetails(
              controller: controller,
            ),
            Container(
              height: 50,
              // width: Get.width / 2,
              padding: EdgeInsets.symmetric(
                horizontal: 4,
              ),
              child: Form(
                // key: controller.fK,
                child: TypeAheadFormField(
                  suggestionsCallback: (p) {
                    var c = controller.vTypes
                        .where((element) => element.typeAr!
                            .toLowerCase()
                            .contains(p.toLowerCase()))
                        .toList();
                    return controller.vTypes.where((element) => element.typeAr!
                        .toLowerCase()
                        .contains(p.toLowerCase()));
                  },
                  itemBuilder: (_, VType item) => ListTile(
                    leading: Text(item.typeAr!.toString()),
                  ),
                  onSuggestionSelected: (VType v) {
                    controller.vType(v.type);
                    controller.searchType.text = v.typeAr!.toString();
                  },
                  getImmediateSuggestions: true,
                  hideSuggestionsOnKeyboardHide: true,
                  hideKeyboard: false,
                  hideOnEmpty: false,
                  noItemsFoundBuilder: (_) => Padding(
                    padding: EdgeInsets.all(10),
                    child: ListTile(
                      onTap: () {
                        // controller.addLocation();
                      },
                      leading: Text('لم نجد نوع شاحنة مماثل'),
                    ),
                  ),
                  textFieldConfiguration: TextFieldConfiguration(
                    decoration: InputDecoration(
                      hintText: 'اختر نوع الشاحنة الذي ترغب به',
                      border: OutlineInputBorder(),
                    ),
                    controller: controller.searchType,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// 