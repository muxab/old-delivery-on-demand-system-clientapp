class Journey {
  int? id;
  String? uuid;
  dynamic wage;
  dynamic changeReason;
  bool? changedVehicle;
  String? status;
  String? payment;
  String? destAddress;
  String? originAddress;
  dynamic vehicleId;
  String? created;
  String? updated;

  Journey(
      {this.id,
      this.uuid,
      this.wage,
      this.changeReason,
      this.changedVehicle,
      this.status,
      this.payment,
      this.destAddress,
      this.originAddress,
      this.vehicleId,
      this.created,
      this.updated});

  Journey.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    wage = json['wage'];
    changeReason = json['changeReason'];
    changedVehicle = json['changedVehicle'];
    status = json['status'];
    payment = json['payment'];
    destAddress = json['dest_address'];
    originAddress = json['origin_address'];
    vehicleId = json['vehicleId'];
    created = json['created'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['uuid'] = uuid;
    data['wage'] = wage;
    data['changeReason'] = changeReason;
    data['changedVehicle'] = changedVehicle;
    data['status'] = status;
    data['payment'] = payment;
    data['dest_address'] = destAddress;
    data['origin_address'] = originAddress;
    data['vehicleId'] = vehicleId;
    data['created'] = created;
    data['updated'] = updated;
    return data;
  }
}
