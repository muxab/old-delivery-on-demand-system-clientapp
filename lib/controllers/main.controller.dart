import 'package:client/data/models/shipment.model.dart';
import 'package:client/data/models/user.model.dart';
import 'package:client/data/providers/shipments.provider.dart';
import 'package:client/data/providers/user.provider.dart';
import 'package:get/get.dart';

import '../data/sockets/main_socket.dart';

class MainController extends GetxController {
  var pageIndex = 0.obs;
  var loading = true.obs;
  var sysError = false.obs;
  var isEmpty = false.obs;
  var isNewEmpty = false.obs;

  var shipments = List<dynamic>.empty(growable: true).obs;
  var newShipments = List<dynamic>.empty(growable: true).obs;
  User? client;

  @override
  void onInit() {
    super.onInit();
    // getUser();
    UserProvider().validateUser().then((value) {
      client = User.fromJson(value);
      getInitialData();
      // connectSocket();
    }).catchError((_) {
      sysError(true);
    });
  }

  @override
  void onClose() {}

  naivgate(route) {
    Get.toNamed('/$route');
  }

  Future<void> getInitialData() async {
    loading(true);

    //Get on vehicle journeys
    ShipmentsProvider().getCurrnet().then((response) {
      if (response.isEmpty) {
        isEmpty(true);
      } else {
        var jsonShipments = response.map((v) => Shipment.fromJson(v)).toList();
        shipments(jsonShipments);
        print(shipments);
      }
    });

    //get new shipments
    ShipmentsProvider().getCurrnetNew().then((response) {
      if (response.isEmpty) {
        isNewEmpty(true);
      } else {
        var jsonShipments = response.map((v) => Shipment.fromJson(v)).toList();
        newShipments(jsonShipments);
      }
    });

    Future.delayed(
      const Duration(seconds: 2),
      () {
        loading(false);
      },
    );
  }

  connectSocket() {
    Sockets().intiConnection(client!.bId!.toString());
    // Sockets().testConnection();
  }
}
