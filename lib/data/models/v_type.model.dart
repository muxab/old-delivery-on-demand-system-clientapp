// To parse this JSON data, do
//
//     final vType = vTypeFromJson(jsonString);

import 'dart:convert';

VType vTypeFromJson(String str) => VType.fromJson(json.decode(str));

String vTypeToJson(VType data) => json.encode(data.toJson());

class VType {
  VType({
    this.id,
    this.type,
    this.typeAr,
    this.image,
  });

  int? id;
  String? type;
  String? typeAr;
  String? image;

  factory VType.fromJson(Map<String, dynamic> json) => VType(
        id: json["id"],
        type: json["type"],
        typeAr: json["type_ar"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "type_ar": typeAr,
        "image": image,
      };
}
