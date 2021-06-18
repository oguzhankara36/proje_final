import 'dart:convert';

List<BurcListe> burcListeFromJson(String str) => List<BurcListe>.from(json.decode(str).map((x) => BurcListe.fromJson(x)));

String burcListeToJson(List<BurcListe> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BurcListe {
  BurcListe({
    this.burc,
    this.cinsiyet,
    this.title,
  });

  String burc;
  String cinsiyet;
  String title;

  factory BurcListe.fromJson(Map<String, dynamic> json) => BurcListe(
    burc: json["burc"],
    cinsiyet: json["cinsiyet"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "burc": burc,
    "cinsiyet": cinsiyet,
    "title": title,
  };
}



class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
