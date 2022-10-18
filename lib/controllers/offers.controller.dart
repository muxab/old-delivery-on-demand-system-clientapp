import 'package:client/data/models/shipment.model.dart';
import 'package:client/data/providers/offers.provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OffersController extends GetxController {
  var loading = true.obs;
  var sysError = false.obs;

  var offersList = List<WithOffer>.empty(growable: true).obs;
  var searchList = List<WithOffer>.empty(growable: true).obs;
  var tmpList = List<WithOffer>.empty(growable: true).obs;

  var searching = false.obs;

  TextEditingController search = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    print('ok');
    shipmentsOffers();
  }

  @override
  void onClose() {}

  shipmentsOffers() {
    loading(true);
    OffersProvider().getAllOffers().then((value) {
      offersList.value = value.map((e) => WithOffer.fromJson(e)).toList();
      searchList.value = value.map((e) => WithOffer.fromJson(e)).toList();
      tmpList.value = value.map((e) => WithOffer.fromJson(e)).toList();
    });
    Future.delayed(const Duration(seconds: 1), () => loading(false));
  }

  offers(uuid) {
    loading(true);
    OffersProvider().getSingle(uuid).then((v) {});
    Future.delayed(const Duration(seconds: 2), () => loading(false));
  }

  void searchShipment() {
    if (search.text != '' || search.text.isNotEmpty) {
      offersList.value = searchList
          .where(
            (fc) => fc.trackNo!.toLowerCase().contains(
                  search.text.toLowerCase(),
                ),
          )
          .toList();
    } else {
      onInit();
    }
  }
}
