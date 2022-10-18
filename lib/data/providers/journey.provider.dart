import 'package:client/data/models/journey.model.dart';
import 'package:client/statics/apis.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class JourneyProvider extends GetConnect {
  final storage = GetStorage();

  Future<dynamic> createJourney(data) async {
    var token = await storage.read('token');

    final response = await post(
      '$mainUrl/client-journey/new',
      data,
      headers: {'Authorization': 'Bearer $token'},
    );

    var journey = response.body;
    return journey;
  }

  Future<List<dynamic>> getAll() async {
    var token = await storage.read('token');

    final response = await get(
      '$mainUrl/client-journey/journeys',
      headers: {'Authorization': 'Bearer $token'},
    );

    final journeys = response.body['journeys'];
    return journeys.map((item) => Journey.fromJson(item)).toList();
  }

  Future<dynamic> getPrice(data) async {
    var token = await storage.read('token');

    final response = await post(
      '$mainUrl/trip/search',
      data,
      headers: {'Authorization': 'Bearer $token'},
    );

    final price = response.body['price'];
    return price;
  }
}
