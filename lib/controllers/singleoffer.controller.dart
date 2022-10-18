import 'package:client/data/models/offer.model.dart';
import 'package:client/data/models/shipment-a-offers.model.dart';
import 'package:client/data/providers/offers.provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleOfferController extends GetxController {
  var loading = false.obs;
  var offerLoading = false.obs;
  var offerLoadingErr = false.obs;
  var offerAccepted = false.obs;

  ShipmentOffers? shipment;
  var uuid = Get.parameters['uuid'];

  Offer? offer;

  @override
  void onInit() {
    super.onInit();
    getOffers();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  getOffers() {
    loading(true);
    OffersProvider().getSingle(uuid).then((e) {
      ///[Sis]
      ///
      shipment = ShipmentOffers.fromJson(e);
      Future.delayed(const Duration(seconds: 3), () {
        loading(false);
      });
    });
  }

  showOffer(offerUuid) {
    offerLoadingErr(false);

    offerLoading(true);
    OffersProvider().showOffer(offerUuid).then((e) {
      offer = Offer.fromJson(e);

      Future.delayed(const Duration(seconds: 1), () {
        offerLoading(false);
      });
    }).catchError((_) {
      printError(info: _.toString());
      offerLoadingErr(true);
    });
  }

  acceptOffer() {
    var data = {
      'vehicle_uuid': offer!.vehicle!.uuid,
      'offer_uuid': offer!.uuid,
      'shipment_uuid': shipment!.uuid
    };

    ///
    OffersProvider().acceptOffer(offer!.uuid!, data).then((e) {
      if (e['msg'] == 'VOS') {
        Get.defaultDialog(
          title: 'عذرا .. المركبة غير متوفرة',
          content: Container(
            color: Colors.amber,
            child: const Text('الرجاء مراجعة عروض اخرى '),
          ),
          radius: 2,
        );
      } else {
        Get.offAllNamed('/shipment/${shipment!.uuid}');
      }
    }).catchError((_) {
      printError(info: _.toString());
    });
  }

  rejectOffer() {
    OffersProvider().rejectOffer(offer!.uuid).then((e) {
      getOffers();
    });
  }
}
