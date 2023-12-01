// To parse this JSON data, do
//
//     final aiToolType = aiToolTypeFromJson(jsonString);

import 'dart:convert';

List<AiToolType> aiToolTypeFromJson(String str) =>
    List<AiToolType>.from(json.decode(str).map((x) => AiToolType.fromJson(x)));

String aiToolTypeToJson(List<AiToolType> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AiToolType {
  String id;
  String title;
  String link;
  int favouriteCount;
  Whois whois;
  Pricing pricing;
  String video;
  Gpt33 gpt33;
  List<String> category2;
  String thumbnail;
  List<String> category;

  AiToolType({
    required this.id,
    required this.title,
    required this.link,
    required this.favouriteCount,
    required this.whois,
    required this.pricing,
    required this.video,
    required this.gpt33,
    required this.category2,
    required this.thumbnail,
    required this.category,
  });

  factory AiToolType.fromJson(Map<String, dynamic> json) => AiToolType(
        id: json["_id"],
        title: json["title"],
        link: json["link"],
        favouriteCount: json["favourite_count"],
        whois: Whois.fromJson(json["whois"]),
        pricing: Pricing.fromJson(json["pricing"]),
        video: json["video"],
        gpt33: Gpt33.fromJson(json["gpt33"]),
        category2: List<String>.from(json["category2"].map((x) => x)),
        thumbnail: json["thumbnail"],
        category: List<String>.from(json["category"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "link": link,
        "favourite_count": favouriteCount,
        "whois": whois.toJson(),
        "pricing": pricing.toJson(),
        "video": video,
        "gpt33": gpt33.toJson(),
        "category2": List<dynamic>.from(category2.map((x) => x)),
        "thumbnail": thumbnail,
        "category": List<dynamic>.from(category.map((x) => x)),
      };
}

class Gpt33 {
  String heading;

  Gpt33({
    required this.heading,
  });

  factory Gpt33.fromJson(Map<String, dynamic> json) => Gpt33(
        heading: json["heading"],
      );

  Map<String, dynamic> toJson() => {
        "heading": heading,
      };
}

class Pricing {
  String price;
  String type;

  Pricing({
    required this.price,
    required this.type,
  });

  factory Pricing.fromJson(Map<String, dynamic> json) => Pricing(
        price: json["price"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "type": type,
      };
}

class Whois {
  String? creationDate;

  Whois({
    required this.creationDate,
  });

  factory Whois.fromJson(Map<String, dynamic> json) => Whois(
        creationDate: json["creation_date"],
      );

  Map<String, dynamic> toJson() => {
        "creation_date": creationDate,
      };
}
