import 'package:client/statics/apis.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OffersProvider extends GetConnect {
  final storage = GetStorage();

  Future<List<dynamic>> getAllOffers() async {
    var token = await storage.read('token');

    final response = await get(
      '$mainUrl/client-shipment/shipments-offers',
      headers: {'Authorization': 'Bearer $token'},
    );

    print(response.body);
    return response.body;
  }

  Future<dynamic> getSingle(uuid) async {
    var token = await storage.read('token');

    final response = await get(
      '$mainUrl/client-shipment/shipment/$uuid/offers',
      headers: {'Authorization': 'Bearer $token'},
    );

    return response.body;
  }

  Future<dynamic> showOffer(uuid) async {
    var token = await storage.read('token');

    final response = await get(
      '$mainUrl/client-shipment/offer/$uuid',
      headers: {'Authorization': 'Bearer $token'},
    );

    return response.body;
  }

  Future<dynamic> acceptOffer(uuid, data) async {
    var token = await storage.read('token');

    final response = await post(
      '$mainUrl/client-shipment/accept-offer/$uuid',
      data,
      headers: {'Authorization': 'Bearer $token'},
    );

    return response.body;
  }

  Future<dynamic> rejectOffer(uuid) async {
    var token = await storage.read('token');

    final response = await delete(
      '$mainUrl/client-shipment/reject-offer/$uuid',
      headers: {'Authorization': 'Bearer $token'},
    );

    print(response.body);
    return response.body;
  }
}
