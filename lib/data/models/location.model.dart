class Location {
  Location({
    this.id,
    this.city,
    this.cityEn,
    this.code,
  });

  int? id;
  String? city;
  String? cityEn;
  String? code;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        city: json["city"],
        cityEn: json["city_en"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "city": city,
        "city_en": cityEn,
        "code": code,
      };
}
