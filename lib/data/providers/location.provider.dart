import 'package:client/statics/apis.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocationProvider extends GetConnect {
  final storage = GetStorage();

  Future<List<dynamic>> getAll(String? query) async {
    if (query == null) {
      final response = await get(
        '$mainUrl/main',
      );
      if (response.status.hasError) {
        throw Exception('Error :: ');
      } else {
        return response.body['locations'];
      }
    } else {
      final response = await get(
        '$mainUrl/main',
        query: {'query': query},
      );

      if (response.status.hasError) {
        throw Exception('Error :: ');
      } else {
        return response.body['locations'];
      }
    }
  }

  Future<dynamic> newLocation(String text) async {
    var token = await storage.read('token');

    final response = await post(
      '$mainUrl/main/newLocation',
      {'location': text},
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.status.hasError) {
      throw Exception('Error :: ');
    } else {
      return response.body;
    }
  }
}
