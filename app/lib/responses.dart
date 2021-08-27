import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

const API_URI = "https://superheroapi.com/api";
const API_KEY = "10158478527163526";

Future<SuperHeroSingleResponse> fetchSuperHeroSingleResponse(String search_value) async {
  print('fetchSuperHeroSingleResponse.....\n');
  String uri = '$API_URI/$API_KEY/$search_value';
  final response = await http.get(
    Uri.parse(uri),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return SuperHeroSingleResponse.fromJson(jsonDecode(response.body));
  } else {
    print('Exception has occurred.... Failed to load super hero data.');
    throw Exception('Failed to load super hero data');
  }
}

Future<SuperHeroMultipleResponse> fetchSuperHeroMultipleResponse(String search_value) async {
  print('fetchSuperHeroMultipleResponse.....\n');
  print('search_value: $search_value \n');
  String uri = '$API_URI/$API_KEY/search/$search_value';
  final response = await http.get(
    Uri.parse(uri),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return SuperHeroMultipleResponse.fromJson(jsonDecode(response.body));
  } else {
    print('Exception has occurred.... Failed to load super hero data.');
    throw Exception('Failed to load super hero data');
  }
}

// To parse this JSON data, do
//
// final SuperHeroSingleResponse = SuperHeroSingleResponseFromJson(jsonString);

class SuperHeroSingleResponse {
  SuperHeroSingleResponse({
    required this.response,
    required this.id,
    required this.name,
    required this.powerstats,
    required this.biography,
    required this.appearance,
    required this.work,
    required this.connections,
    required this.heroImage,
  });

  final String response;
  final String id;
  final String name;
  final Powerstats powerstats;
  final Biography biography;
  final Appearance appearance;
  final Work work;
  final Connections connections;
  final HeroImage heroImage;

  factory SuperHeroSingleResponse.fromRawJson(String str) => SuperHeroSingleResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SuperHeroSingleResponse.fromJson(Map<String, dynamic> json) => SuperHeroSingleResponse(
        response: json["response"],
        id: json["id"],
        name: json["name"],
        powerstats: Powerstats.fromJson(json["powerstats"]),
        biography: Biography.fromJson(json["biography"]),
        appearance: Appearance.fromJson(json["appearance"]),
        work: Work.fromJson(json["work"]),
        connections: Connections.fromJson(json["connections"]),
        heroImage: HeroImage.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "response": response,
        "id": id,
        "name": name,
        "powerstats": powerstats.toJson(),
        "biography": biography.toJson(),
        "appearance": appearance.toJson(),
        "work": work.toJson(),
        "connections": connections.toJson(),
        "image": heroImage.toJson(),
      };
}

// To parse this JSON data, do
//
// final superHeroMultipleResponse = superHeroMultipleResponseFromJson(jsonString);

class SuperHeroMultipleResponse {
  SuperHeroMultipleResponse({
    required this.response,
    required this.resultsFor,
    required this.results,
  });

  final String response;
  final String resultsFor;
  final List<Result> results;

  factory SuperHeroMultipleResponse.fromRawJson(String str) => SuperHeroMultipleResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SuperHeroMultipleResponse.fromJson(Map<String, dynamic> json) => SuperHeroMultipleResponse(
        response: json["response"],
        resultsFor: json["results-for"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "response": response,
        "results-for": resultsFor,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.id,
    required this.name,
    required this.powerstats,
    required this.biography,
    required this.appearance,
    required this.work,
    required this.connections,
    required this.heroImage,
  });

  final String id;
  final String name;
  final Powerstats powerstats;
  final Biography biography;
  final Appearance appearance;
  final Work work;
  final Connections connections;
  final HeroImage heroImage;

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        powerstats: Powerstats.fromJson(json["powerstats"]),
        biography: Biography.fromJson(json["biography"]),
        appearance: Appearance.fromJson(json["appearance"]),
        work: Work.fromJson(json["work"]),
        connections: Connections.fromJson(json["connections"]),
        heroImage: HeroImage.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "powerstats": powerstats.toJson(),
        "biography": biography.toJson(),
        "appearance": appearance.toJson(),
        "work": work.toJson(),
        "connections": connections.toJson(),
        "image": heroImage.toJson(),
      };
}

class Appearance {
  Appearance({
    required this.gender,
    required this.race,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hairColor,
  });

  final String gender;
  final String race;
  final List<String> height;
  final List<String> weight;
  final String eyeColor;
  final String hairColor;

  factory Appearance.fromRawJson(String str) => Appearance.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Appearance.fromJson(Map<String, dynamic> json) => Appearance(
        gender: json["gender"],
        race: json["race"],
        height: List<String>.from(json["height"].map((x) => x)),
        weight: List<String>.from(json["weight"].map((x) => x)),
        eyeColor: json["eye-color"],
        hairColor: json["hair-color"],
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "race": race,
        "height": List<dynamic>.from(height.map((x) => x)),
        "weight": List<dynamic>.from(weight.map((x) => x)),
        "eye-color": eyeColor,
        "hair-color": hairColor,
      };
}

class Biography {
  Biography({
    required this.fullName,
    required this.alterEgos,
    required this.aliases,
    required this.placeOfBirth,
    required this.firstAppearance,
    required this.publisher,
    required this.alignment,
  });

  final String fullName;
  final String alterEgos;
  final List<String> aliases;
  final String placeOfBirth;
  final String firstAppearance;
  final String publisher;
  final String alignment;

  factory Biography.fromRawJson(String str) => Biography.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Biography.fromJson(Map<String, dynamic> json) => Biography(
        fullName: json["full-name"],
        alterEgos: json["alter-egos"],
        aliases: List<String>.from(json["aliases"].map((x) => x)),
        placeOfBirth: json["place-of-birth"],
        firstAppearance: json["first-appearance"],
        publisher: json["publisher"],
        alignment: json["alignment"],
      );

  Map<String, dynamic> toJson() => {
        "full-name": fullName,
        "alter-egos": alterEgos,
        "aliases": List<dynamic>.from(aliases.map((x) => x)),
        "place-of-birth": placeOfBirth,
        "first-appearance": firstAppearance,
        "publisher": publisher,
        "alignment": alignment,
      };
}

class Connections {
  Connections({
    required this.groupAffiliation,
    required this.relatives,
  });

  final String groupAffiliation;
  final String relatives;

  factory Connections.fromRawJson(String str) => Connections.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Connections.fromJson(Map<String, dynamic> json) => Connections(
        groupAffiliation: json["group-affiliation"],
        relatives: json["relatives"],
      );

  Map<String, dynamic> toJson() => {
        "group-affiliation": groupAffiliation,
        "relatives": relatives,
      };
}

class HeroImage {
  HeroImage({
    required this.url,
  });

  final String url;

  factory HeroImage.fromRawJson(String str) => HeroImage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HeroImage.fromJson(Map<String, dynamic> json) => HeroImage(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class Powerstats {
  Powerstats({
    required this.intelligence,
    required this.strength,
    required this.speed,
    required this.durability,
    required this.power,
    required this.combat,
  });

  final String intelligence;
  final String strength;
  final String speed;
  final String durability;
  final String power;
  final String combat;

  factory Powerstats.fromRawJson(String str) => Powerstats.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Powerstats.fromJson(Map<String, dynamic> json) => Powerstats(
        intelligence: json["intelligence"],
        strength: json["strength"],
        speed: json["speed"],
        durability: json["durability"],
        power: json["power"],
        combat: json["combat"],
      );

  Map<String, dynamic> toJson() => {
        "intelligence": intelligence,
        "strength": strength,
        "speed": speed,
        "durability": durability,
        "power": power,
        "combat": combat,
      };
}

class Work {
  Work({
    required this.occupation,
    required this.base,
  });

  final String occupation;
  final String base;

  factory Work.fromRawJson(String str) => Work.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Work.fromJson(Map<String, dynamic> json) => Work(
        occupation: json["occupation"],
        base: json["base"],
      );

  Map<String, dynamic> toJson() => {
        "occupation": occupation,
        "base": base,
      };
}
