// To parse this JSON data, do
//
//     final shipment = shipmentFromJson(jsonString);

import 'dart:convert';

import 'package:client/data/models/journey.model.dart';

import 'location.model.dart';

Shipment shipmentFromJson(String str) => Shipment.fromJson(json.decode(str));

String shipmentToJson(Shipment data) => json.encode(data.toJson());

class Shipment {
  int? id;
  String? uuid;
  dynamic weight;
  String? typeS;
  dynamic extra;
  dynamic expenses;
  String? status;
  String? trackNo;
  String? payment;
  String? destAddress;
  String? originAddress;
  DateTime? created;
  DateTime? updated;
  Location? destination;
  Location? origin;
  // Journey? journey;
  Shipment({
    this.id,
    this.uuid,
    this.weight,
    this.typeS,
    this.extra,
    this.expenses,
    this.status,
    this.trackNo,
    this.payment,
    this.destAddress,
    this.originAddress,
    this.created,
    this.updated,
    this.destination,
    this.origin,
    // this.journey,
  });
  factory Shipment.fromJson(Map<String, dynamic> json) => Shipment(
        id: json["id"],
        uuid: json["uuid"],
        weight: json["weight"],
        typeS: json["type_s"],
        extra: json["extra"],
        expenses: json["expenses"],
        status: json["status"],
        trackNo: json["track_no"],
        payment: json["payment"],
        destAddress: json["dest_address"],
        originAddress: json["origin_address"],
        created: DateTime?.parse(json["created"]),
        updated: DateTime?.parse(json["updated"]),
        destination: Location?.fromJson(json["destination"]),
        origin: Location?.fromJson(json["origin"]),
        // journey: Journey.fromJson(json["journey"])
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "weight": weight,
        "type_s": typeS,
        "extra": extra,
        "expenses": expenses,
        "status": status,
        "track_no": trackNo,
        "payment": payment,
        "dest_address": destAddress,
        "origin_address": originAddress,
        "created": created!.toIso8601String(),
        "updated": updated!.toIso8601String(),
        "destination": destination!.toJson(),
        "origin": origin!.toJson(),
        // "journey": journey!.toJson()
      };
}

// To parse this JSON data, do
//
//     final withOffer = withOfferFromJson(jsonString);

List<WithOffer> withOfferFromJson(String str) =>
    List<WithOffer>.from(json.decode(str).map((x) => WithOffer.fromJson(x)));

String withOfferToJson(List<WithOffer> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WithOffer {
  WithOffer({
    this.id,
    this.uuid,
    this.weight,
    this.status,
    this.trackNo,
    this.created,
    this.updated,
    this.newOffers,
  });

  int? id;
  String? uuid;
  int? weight;
  String? status;
  String? trackNo;
  DateTime? created;
  DateTime? updated;
  int? newOffers;

  factory WithOffer.fromJson(Map<String, dynamic> json) => WithOffer(
        id: json["id"],
        uuid: json["uuid"],
        weight: json["weight"],
        status: json["status"],
        trackNo: json["track_no"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        newOffers: json["newOffers"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "weight": weight,
        "status": status,
        "track_no": trackNo,
        "created": created!.toIso8601String(),
        "updated": updated!.toIso8601String(),
        "newOffers": newOffers,
      };
}
