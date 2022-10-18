class Vehicle {
  int? id;
  String? uuid;
  String? liceinseNo;
  String? plateNo;
  String? typeTxt;
  String? status;

  Vehicle({
    this.id,
    this.uuid,
    this.liceinseNo,
    this.plateNo,
    this.typeTxt,
    this.status,
  });

  Vehicle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    liceinseNo = json['liceinse_no'];
    plateNo = json['plate_no'];
    typeTxt = json['type_txt'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['uuid'] = uuid;
    data['liceinse_no'] = liceinseNo;
    data['plate_no'] = plateNo;
    data['type_txt'] = typeTxt;
    data['status'] = status;
    return data;
  }
}
