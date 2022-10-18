// To parse this JSON data, do
//
//     final notification = notificationFromJson(jsonString);

import 'dart:convert';

Notification notificationFromJson(String str) =>
    Notification.fromJson(json.decode(str));

String notificationToJson(Notification data) => json.encode(data.toJson());

class Notification {
  Notification({
    this.id,
    this.notificationId,
    this.message,
    this.type,
    this.read,
    this.userId,
    this.created,
    this.updated,
  });

  int? id;
  String? notificationId;
  String? message;
  String? type;
  bool? read;
  int? userId;
  DateTime? created;
  DateTime? updated;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json["id"],
        notificationId: json["notification_id"],
        message: json["message"],
        type: json["type"],
        read: json["read"],
        userId: json["userId"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "notification_id": notificationId,
        "message": message,
        "type": type,
        "read": read,
        "userId": userId,
        "created": created!.toIso8601String(),
        "updated": updated!.toIso8601String(),
      };
}
