import 'package:client/data/models/location.model.dart';
import 'package:client/data/models/v_type.model.dart';
import 'package:client/data/providers/location.provider.dart';
import 'package:client/data/providers/shipments.provider.dart';
import 'package:client/data/providers/vehicles.provider.dart';
import 'package:client/widgets/newshipment/final_vlaidate.w.dart';
import 'package:client/widgets/newshipment/validate.w.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewShipmentController extends GetxController {
  var locations = List<Location>.empty(growable: true).obs;
  var vTypes = List<VType>.empty(growable: true).obs;

  var fromExtra = TextEditingController();
  var toExtra = TextEditingController();
  var notes = TextEditingController();

  final vehicleFK = GlobalKey<FormState>();

  var weight = TextEditingController();
  var shipmentType = TextEditingController();
  // type is vehicle Type
  var vType = ''.obs;

  var originLocation = ''.obs;
  // var searchOrigin = ''.obs;
  var destinationLocation = ''.obs;
  // var searchDestination = ''.obs;

  var isLoading = true.obs;
  var sysError = false.obs;

  var vIsLoading = false.obs;
  var selectedId = 0.obs;
  var requesting = false.obs;

  var searchOrigin = TextEditingController();
  var searchDestination = TextEditingController();
  var searchQuery = ''.obs;

  final originFK = GlobalKey<FormState>();
  final destinationFK = GlobalKey<FormState>();
  final TextEditingController newLocation = TextEditingController();

  final TextEditingController searchType = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getInitalData();
    // getVTypes();
  }

  @override
  void onClose() {}

  fromSelectorValue(value) {
    originLocation.value = value;
  }

  toSelectorValue(value) {
    destinationLocation.value = value;
  }

  void getInitalData() async {
    isLoading(true);

    await LocationProvider().getAll(searchQuery.value).then(
      (locs) {
        locations.value = locs.map((e) => Location.fromJson(e)).toList();
        originLocation.value = locations[0].city!;
        destinationLocation.value = locations[0].city!;
      },
      onError: (e) {},
    ).catchError((_) {
      sysError(true);
    });
    VTypesProvider().vehiclesList().then(
      (values) {
        vTypes.value = values.map((elemnt) => VType.fromJson(elemnt)).toList();
      },
    );

    Future.delayed(
      const Duration(seconds: 2),
      () {
        vIsLoading(false);
        isLoading(false);
      },
    );
  }

  finalValidate() {
    if (originFK.currentState!.validate() &&
        destinationFK.currentState!.validate() &&
        vehicleFK.currentState!.validate()) {
      var data = {
        'weight': weight.text,
        'origin_address': fromExtra.text,
        'dest_address': toExtra.text,
        'origin': originLocation.value.toString(),
        'destination': destinationLocation.value.toString(),
        'type_s': shipmentType.text,
        'v_type': vType(),
      };

      finalValidateCard(
        data,
      );
    }
  }

  addShipment(data) {
    ShipmentsProvider().createShipment(data).then(
      (value) {
        var sUuid = value['shipment']['uuid'];
        Get.snackbar('Success', 'تم اضافة الرحلة ');

        // Go To SHipment Details Using the uuid code of shipment ...
        Get.offAllNamed('/shipment/$sUuid');
      },
    ).catchError((_) {
      Get.defaultDialog(title: 'error');
    });
  }

  addLocation() {
    isLoading(true);
    String? newLocText;
    newLocation.text.isEmpty
        ? newLocText = searchOrigin.text
        : newLocation.text;

    LocationProvider().newLocation(newLocText!).then((value) {
      var newLoc = Location.fromJson(value);
      locations.add(newLoc);
      searchOrigin.text = newLoc.city!.toString();
      originLocation.value = newLoc.city.toString();
      isLoading(false);
    }).catchError((_) {
      isLoading(false);
      Get.defaultDialog(
        title: 'حــدث خطـأ ما',
        content: const Text('حــاول مجددا او اتصل بنا'),
      );
    });
  }
}
