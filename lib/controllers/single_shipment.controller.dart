import 'package:client/data/models/shipment.model.dart';
import 'package:client/data/models/user.model.dart';
import 'package:client/data/providers/shipments.provider.dart';
import 'package:client/data/providers/vehicles.provider.dart';
import 'package:get/get.dart';

import '../data/models/vehicle.model.dart';

class ShipmentController extends GetxController {
  var uuid = Get.parameters['uuid'];
  var loading = true.obs;

  Shipment? shipment;

  Vehicle? vehicle;
  User? driver;

  var sysError = false.obs;

  @override
  void onInit() {
    super.onInit();
    getDetails();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // Get.delete<ShipmentController>();
  }

  getDetails() {
    loading(true);
    ShipmentsProvider().getShipment(uuid!).then((value) {
      shipment = value;
      if (shipment!.status == 'onvehicle' || shipment!.status == 'pick') {
        getVehicleAndDriver();
      }
      Future.delayed(const Duration(seconds: 2), () {
        loading(false);
      });
    }).catchError(
      (_) {
        sysError(true);
      },
    );
  }

  navigate() {
    Get.offAllNamed('/shipments');
  }

  cancelShipment() {
    ShipmentsProvider().cancelShipment(uuid!).then((value) {
      Get.offAllNamed('/main');
    }).catchError(
      (_) {
        sysError(true);
      },
    );
  }

  getVehicleAndDriver() {
    VehiclesProvider().getvehicelAndDriver(uuid).then((value) {
      if (value['error'] == true) {
      } else {
        vehicle = Vehicle.fromJson(value['vehicle']);
        driver = User.fromJson(value['vehicle']['driver']);
      }
    });
  }
}
