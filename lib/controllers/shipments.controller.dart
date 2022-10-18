import 'package:client/data/models/shipment.model.dart';
import 'package:client/data/providers/shipments.provider.dart';
import 'package:get/get.dart';

class ShipmentsController extends GetxController {
  var shipments = List<dynamic>.empty(growable: true).obs;
  var loading = true.obs;

  var isEmpty = false.obs;

  @override
  void onInit() {
    super.onInit();
    getShipment();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void getShipment() {
    loading(true);
    ShipmentsProvider().getAll().then(
      (response) {
        if (response! == []) {
          isEmpty(true);
          shipments.clear();
        } else {
          var jsonShipments =
              response.map((v) => Shipment.fromJson(v)).toList();
          shipments(jsonShipments);
        }
        loading(false);
      },
    ).catchError((_) {
      shipments.clear();
      loading(false);
    });
  }

  back() {
    Get.offAllNamed('/main');
  }
}
