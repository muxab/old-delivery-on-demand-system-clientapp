// To parse this JSON data, do
//
//     final offer = offerFromJson(jsonString);

import 'dart:convert';

Offer offerFromJson(String str) => Offer.fromJson(json.decode(str));

class Offer {
  Offer({
    this.id,
    this.uuid,
    this.trackNo,
    this.amount,
    this.read,
    this.rejected,
    this.accepted,
    this.created,
    this.updated,
    this.vehicle,
  });

  int? id;
  String? uuid;
  String? trackNo;
  int? amount;
  bool? read;
  bool? rejected;
  bool? accepted;
  DateTime? created;
  DateTime? updated;
  Vehicle? vehicle;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        id: json["id"],
        uuid: json["uuid"],
        trackNo: json["track_no"],
        amount: json["amount"],
        read: json["read"],
        rejected: json["rejected"],
        accepted: json["accepted"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        vehicle: Vehicle.fromJson(json["vehicle"]),
      );
}

class Vehicle {
  Vehicle({
    this.id,
    this.uuid,
    this.maxLoad,
    this.liceinseNo,
    this.plateNo,
    this.typeTxt,
    this.status,
    this.typeId,
    this.companyId,
    this.currentId,
    this.created,
    this.updated,
  });

  int? id;
  String? uuid;
  int? maxLoad;
  String? liceinseNo;
  String? plateNo;
  String? typeTxt;
  String? status;
  int? typeId;
  dynamic companyId;
  dynamic currentId;
  DateTime? created;
  DateTime? updated;

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        id: json["id"],
        uuid: json["uuid"],
        maxLoad: json["max_load"],
        liceinseNo: json["liceinse_no"],
        plateNo: json["plate_no"],
        typeTxt: json["type_txt"],
        status: json["status"],
        typeId: json["typeId"],
        companyId: json["companyId"],
        currentId: json["currentId"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
      );
}
