// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int? id;
  String? bId;
  String? name;
  String? phone;
  String? nid;
  String? email;
  bool? isCompany;
  String? companyName;
  String? role;
  DateTime? created;
  DateTime? updated;

  User({
    this.id,
    this.bId,
    this.name,
    this.phone,
    this.nid,
    this.email,
    this.isCompany,
    this.companyName,
    this.role,
    this.created,
    this.updated,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        bId: json["b_id"],
        name: json["name"],
        phone: json["phone"],
        nid: json["nid"],
        email: json["email"],
        isCompany: json["isCompany"],
        companyName: json["company_name"],
        role: json["role"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "b_id": bId,
        "name": name,
        "phone": phone,
        "nid": nid,
        "email": email,
        "isCompany": isCompany,
        "company_name": companyName,
        "role": role,
        "created": created!.toIso8601String(),
        "updated": updated!.toIso8601String(),
      };
}
