import 'package:client/controllers/newshipment.controller.dart';
import 'package:client/widgets/general/loading.w.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../data/models/v_type.model.dart';
import '../statics/fonts.dart';
import '../widgets/newshipment/moredetails.w.dart';
import '../widgets/newshipment/selector.w.dart';

class NewShipmentView extends GetView<NewShipmentController> {
  const NewShipmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.indigo,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.indigo),
            onPressed: () {
              Get.back();
            }),
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(4.0),
          child: controller.isLoading.value
              ? const LoadingWidget()
              : SizedBox(
                  // reverse: true,
                  // width: Get.width,
                  height: Get.height,
                  child: ListView(
                    // scrollDirection: Axis.vertical,
                    children: [
                      // origin Widget
                      CityPickWidget(
                        controller: controller,
                        // text: controller.toExtra,
                        title: 'عنوان رفع الشحنة',
                        codeLocation: controller.originLocation(),
                        // valueChanger: controller.toSelectorValue,
                        type: 'origin',
                      ),

                      //destintation Widget
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
                        height: 80,
                        // width: Get.width / 2,
                        padding: const EdgeInsets.symmetric(horizontal: 10),

                        child: Form(
                          key: controller.vehicleFK,
                          child: TypeAheadFormField(
                            validator: (t) {
                              if (t!.isEmpty) {
                                return 'الرجاء اختيار نوع الشاحنة';
                              }
                            },
                            direction: AxisDirection.up,
                            suggestionsCallback: (p) {
                              return controller.vTypes.where((element) =>
                                  element.typeAr!
                                      .toLowerCase()
                                      .contains(p.toLowerCase()));
                            },
                            itemBuilder: (_, VType item) => ListTile(
                              leading: Text(item.typeAr!.toString()),
                              trailing: const Icon(CupertinoIcons.car_fill),
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
                              padding: const EdgeInsets.all(10),
                              child: ListTile(
                                onTap: () {
                                  // controller.addLocation();
                                },
                                leading: const Text('لم نجد نوع شاحنة مماثل'),
                              ),
                            ),
                            textFieldConfiguration: TextFieldConfiguration(
                              decoration: const InputDecoration(
                                hintText: 'اختر نوع الشاحنة الذي ترغب به',
                                border: OutlineInputBorder(),
                              ),
                              controller: controller.searchType,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        width: Get.width / 2,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.finalValidate();
                          },
                          child: lightMediumText('تــأكيد'),
                          style: ElevatedButton.styleFrom(
                            elevation: 20,
                            primary: Colors.indigo,
                            shadowColor: Colors.indigoAccent,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
