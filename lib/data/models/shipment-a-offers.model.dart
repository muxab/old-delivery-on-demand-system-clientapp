// To parse this JSON data, do
//
//     final shipmentOffers = shipmentOffersFromJson(jsonString);

import 'dart:convert';

import 'package:client/data/models/location.model.dart';

ShipmentOffers shipmentOffersFromJson(String str) =>
    ShipmentOffers.fromJson(json.decode(str));

class ShipmentOffers {
  ShipmentOffers({
    this.id,
    this.uuid,
    this.status,
    this.trackNo,
    this.created,
    this.updated,
    this.offers,
    this.destination,
    this.origin,
  });

  int? id;
  String? uuid;

  String? status;
  String? trackNo;

  DateTime? created;
  DateTime? updated;
  List<AOffer>? offers;
  Location? destination;
  Location? origin;

  factory ShipmentOffers.fromJson(Map<String, dynamic> json) => ShipmentOffers(
        id: json["id"],
        uuid: json["uuid"],
        status: json["status"],
        trackNo: json["track_no"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        offers:
            List<AOffer>.from(json["offers"].map((x) => AOffer.fromJson(x))),
        destination: Location.fromJson(json["destination"]),
        origin: Location.fromJson(json["origin"]),
      );
}

class AOffer {
  AOffer({
    this.id,
    this.uuid,
    this.trackNo,
    this.amount,
    this.read,
    this.rejected,
    this.created,
  });

  int? id;
  String? uuid;
  String? trackNo;
  int? amount;
  bool? read;
  bool? rejected;
  DateTime? created;

  factory AOffer.fromJson(Map<String, dynamic> json) => AOffer(
        id: json["id"],
        uuid: json["uuid"],
        trackNo: json["track_no"],
        amount: json["amount"],
        read: json["read"],
        rejected: json["rejected"],
        created: DateTime.parse(json["created"]),
      );
}
