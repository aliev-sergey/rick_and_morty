// To parse this JSON data, do
//
//     final dtoCharacterList = dtoCharacterListFromJson(jsonString);

import 'dart:convert';

DtoCharacterList dtoCharacterListFromJson(String str) => DtoCharacterList.fromJson(json.decode(str));

String dtoCharacterListToJson(DtoCharacterList data) => json.encode(data.toJson());

class DtoCharacterList {
  DtoCharacterList({
    this.info,
    this.results,
  });

  Info? info;
  List<Result>? results;

  factory DtoCharacterList.fromJson(Map<String, dynamic> json) => DtoCharacterList(
    info: Info.fromJson(json["info"]),
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "info": info?.toJson(),
    "results": results != null ? List<dynamic>.from(results!.map((x) => x.toJson())) : null,
  };
}

class Info {
  Info({
    this.count,
    this.pages,
    this.next,
    this.prev,
  });

  int? count;
  int? pages;
  String? next;
  dynamic prev;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    count: json["count"],
    pages: json["pages"],
    next: json["next"],
    prev: json["prev"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "pages": pages,
    "next": next,
    "prev": prev,
  };
}

class Result {
  Result({
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

  factory Result.fromJson(Map<String, dynamic> json) => Result(
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
