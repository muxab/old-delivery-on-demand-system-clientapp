import 'dart:io';

import 'package:client/data/models/journey.model.dart';
import 'package:client/statics/apis.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PaymentProvider extends GetConnect {
  final storage = GetStorage();

  Future<dynamic> sendInvoice(File file, serial) async {
    var token = await storage.read('token');
    final form = FormData(
      {
        'invoice': MultipartFile(file, filename: file.path),
        'uuid': serial,
      },
    );

    final response = await post(
      '$mainUrl/invoice/new',
      form,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    return response.body;
  }
}
