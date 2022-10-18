import 'package:client/data/models/shipment.model.dart';
import 'package:client/statics/apis.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ShipmentsProvider extends GetConnect {
  final storage = GetStorage();

  Future<dynamic> createShipment(data) async {
    var token = await storage.read('token');

    final response = await post('$mainUrl/client-shipment/new', data,
        headers: {'Authorization': 'Bearer $token'});

    var shipment = response.body;
    return shipment;
  }

  Future<List<dynamic>?> getAll() async {
    var token = await storage.read('token');

    final response = await get('$mainUrl/client-shipment/shipments',
        headers: {'Authorization': 'Bearer $token'});

    return response.body['shipments'];
  }

  Future<List<dynamic>> getCurrnet() async {
    var token = await storage.read('token');

    final response = await get('$mainUrl/client-shipment/current-shipments',
        headers: {'Authorization': 'Bearer $token'});

    print(response.body['shipments']);
    return response.body['shipments'];

    // return shipments.map((item) => Shipment.fromJson(item)).toList();
  }

  Future<List<dynamic>> getCurrnetNew() async {
    var token = await storage.read('token');

    final response = await get('$mainUrl/client-shipment/current-new-shipments',
        headers: {'Authorization': 'Bearer $token'});

    return response.body['shipments'];
  }

  Future<dynamic> getShipment(String uuid) async {
    var token = await storage.read('token');

    final response = await get('$mainUrl/client-shipment/shipment/$uuid',
        headers: {'Authorization': 'Bearer $token'});

    final shipment = response.body['shipment'];
    return Shipment.fromJson(shipment);
  }

  Future<dynamic> cancelShipment(String uuid) async {
    var token = await storage.read('token');

    final response = await delete(
        '$mainUrl/client-shipment/shipments/cancel/$uuid',
        headers: {'Authorization': 'Bearer $token'});

    if (response.body['success'] == true) {
      return {'success': true};
    }
  }
}
