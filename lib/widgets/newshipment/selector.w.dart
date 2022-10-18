import 'package:client/controllers/newshipment.controller.dart';
import 'package:client/statics/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

import '../../data/models/location.model.dart';

class CityPickWidget extends StatefulWidget {
  const CityPickWidget({
    Key? key,
    required this.controller,
    // required this.text,
    required this.title,
    // required this.valueChanger,
    required this.codeLocation,
    required this.type,
  }) : super(key: key);
  final NewShipmentController controller;
  final String title;
  final String? codeLocation;
  final String? type;

  @override
  State<CityPickWidget> createState() => _CityPickWidgetState();
}

class _CityPickWidgetState extends State<CityPickWidget> {
  // final TextEditingController text;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Container(
        height: 250,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(1)),
        width: Get.width,
        child: Form(
          key: widget.type == 'origin'
              ? widget.controller.originFK
              : widget.controller.destinationFK,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: darkMediumText(widget.title.toString()),
              ),

              /// [Selector] Of City
              ///
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TypeAheadFormField(
                  validator: (t) {
                    if (t!.isEmpty) {
                      return 'الرجاء اختيار المدينة';
                    }
                  },
                  suggestionsCallback: (p) => widget.controller.locations.where(
                      (element) => element.city!
                          .toLowerCase()
                          .contains(p.toLowerCase())),
                  itemBuilder: (_, Location item) => ListTile(
                    visualDensity: VisualDensity.compact,
                    leading: Text(item.city!.toString()),
                    trailing: const Icon(
                      Icons.location_city,
                      color: Colors.indigo,
                    ),
                  ),
                  onSuggestionSelected: (Location v) {
                    print(widget.controller.searchOrigin.text +
                        '  ' +
                        widget.controller.originLocation.value);

                    print(widget.controller.searchDestination.text +
                        '   ' +
                        widget.controller.destinationLocation.value.toString());
                    if (widget.type == 'origin'.trim()) {
                      widget.controller.searchOrigin.text = v.city!.toString();
                      widget.controller.originLocation.value =
                          v.city.toString();
                    } else {
                      widget.controller.searchDestination.text =
                          v.city!.toString();
                      widget.controller.destinationLocation.value =
                          v.city.toString();
                    }
                  },
                  getImmediateSuggestions: true,
                  hideSuggestionsOnKeyboardHide: true,
                  hideOnEmpty: false,
                  noItemsFoundBuilder: (_) => Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListTile(
                      onTap: () {
                        // controller.addLocation();
                        Get.defaultDialog(
                          radius: 4,
                          title: 'اضــافة مكان',
                          content: SizedBox(
                            height: 100,
                            width: Get.width - (Get.width / 3),
                            child: Center(
                              child: TextFormField(
                                controller: widget.type == 'origin'
                                    ? widget.controller.searchOrigin
                                    : widget.controller.searchDestination,
                                textDirection: TextDirection.rtl,
                                decoration: InputDecoration(
                                  hintText: widget.type == 'origin'
                                      ? widget.controller.searchOrigin.text
                                      : widget
                                          .controller.searchDestination.text,
                                ),
                              ),
                            ),
                          ),
                          confirm: ElevatedButton.icon(
                            onPressed: () {
                              widget.controller.addLocation();
                              Get.back();
                              Get.defaultDialog(
                                  radius: 0,
                                  title: '',
                                  content: SizedBox(
                                    height: 20,
                                    width: Get.width - (Get.width / 2),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('تمت الاضـافة'),
                                          IconButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            icon: const Icon(
                                              Icons.check,
                                              color: Colors.green,
                                            ),
                                          ),
                                        ]),
                                  ));
                            },
                            // onPressed: () {
                            // },
                            icon: const Icon(Icons.add),
                            label: const Text('إضــافة'),
                          ),
                        );
                      },
                      leading: Text(widget.type == 'origin'
                          ? 'اضـافة الانطلاق ${widget.controller.searchOrigin.text.toString()}'
                          : 'اضـافة الوجهة ${widget.controller.searchDestination.text.toString()}'),
                    ),
                  ),
                  textFieldConfiguration: TextFieldConfiguration(
                    decoration: InputDecoration(
                      hintText: widget.type == 'origin'
                          ? 'مدينة الانطلاق'
                          : 'مدينة الوصول',
                      border: const OutlineInputBorder(),
                    ),
                    controller: widget.type == 'origin'
                        ? widget.controller.searchOrigin
                        : widget.controller.searchDestination,
                  ),
                ),
              ),

              /// [Address] Details Of City
              Container(
                // width: 200,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width / 2,
                      height: 80,
                      child: TextFormField(
                        validator: (_) {
                          if (_!.isEmpty) {
                            return 'ادخل تفاصيل العنوان';
                          }
                        },
                        controller: widget.type == 'origin'
                            ? widget.controller.fromExtra
                            : widget.controller.toExtra,
                        textDirection: TextDirection.rtl,
                        decoration: const InputDecoration(
                          label: Text('تفاصيل االعنوان '),
                          focusColor: Colors.red,
                          hintText: 'مثلا : ام درمان السوق الكبير',
                          hintTextDirection: TextDirection.rtl,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        maxLines: 2,
                      ),
                    ),
                    const Text('تفاصيل العنوان'),
                  ],
                ),
                // child: TextFormField(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
