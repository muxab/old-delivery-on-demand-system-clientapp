import 'package:client/statics/apis.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class VTypesProvider extends GetConnect {
  final storage = GetStorage();

  Future<List<dynamic>> vehiclesList() async {
    final response = await get(
      '$mainUrl/main/v-types/',
    );

    return response.body;
  }

  Future<dynamic> getvehicelAndDriver(uuid) async {
    final response = await get(
      '$mainUrl/client-shipment/$uuid/shipment-dr-ve',
    );

    return response.body;
  }
}

class VehiclesProvider extends GetConnect {
  final storage = GetStorage();

  Future<dynamic> getvehicelAndDriver(uuid) async {
    var token = await storage.read('token');

    final response = await get(
      '$mainUrl/client-shipment/shipment/$uuid/shipment-dr-ve',
      headers: {'Authorization': 'Bearer $token'},
    );

    return response.body;
  }
}
