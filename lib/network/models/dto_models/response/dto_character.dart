// To parse this JSON data, do
//
//     final dtoCharacter = dtoCharacterFromJson(jsonString);

import 'dart:convert';

DtoCharacter dtoCharacterFromJson(String str) => DtoCharacter.fromJson(json.decode(str));

String dtoCharacterToJson(DtoCharacter data) => json.encode(data.toJson());

class DtoCharacter {
  DtoCharacter({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Location? origin;
  Location? location;
  String? image;
  List<String>? episode;
  String? url;
  DateTime? created;

  factory DtoCharacter.fromJson(Map<String, dynamic> json) => DtoCharacter(
    id: json["id"],
    name: json["name"],
    status: json["status"],
    species: json["species"],
    type: json["type"],
    gender: json["gender"],
    origin: Location.fromJson(json["origin"]),
    location: Location.fromJson(json["location"]),
    image: json["image"],
    episode: List<String>.from(json["episode"].map((x) => x)),
    url: json["url"],
    created: DateTime.parse(json["created"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
    "species": species,
    "type": type,
    "gender": gender,
    "origin": origin?.toJson(),
    "location": location?.toJson(),
    "image": image,
    "episode": episode != null ? List<dynamic>.from(episode!.map((x) => x)) : null,
    "url": url,
    "created": created?.toIso8601String(),
  };
}

class Location {
  Location({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}
