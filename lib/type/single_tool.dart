import 'dart:convert';

class SingleAiDetails {
  Data data;
  List<RelatedTool> relatedTools;
  String path;
  Meta meta;

  SingleAiDetails({
    required this.data,
    required this.relatedTools,
    required this.path,
    required this.meta,
  });

  factory SingleAiDetails.fromRawJson(String str) =>
      SingleAiDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SingleAiDetails.fromJson(Map<String, dynamic> json) =>
      SingleAiDetails(
        data: Data.fromJson(json["data"]),
        relatedTools: List<RelatedTool>.from(
            json["related_tools"].map((x) => RelatedTool.fromJson(x))),
        path: json["path"],
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "related_tools":
            List<dynamic>.from(relatedTools.map((x) => x.toJson())),
        "path": path,
        "meta": meta.toJson(),
      };
}

class Data {
  String id;
  String title;
  List<String> category;
  String semrushRank;
  int datetime;
  String link;
  int favouriteCount;
  DataWhois whois;
  Pricing pricing;
  List<String> techUsed;
  String video;
  DataGpt33 gpt33;
  List<String> similarTools;

  Data({
    required this.id,
    required this.title,
    required this.category,
    required this.semrushRank,
    required this.datetime,
    required this.link,
    required this.favouriteCount,
    required this.whois,
    required this.pricing,
    required this.techUsed,
    required this.video,
    required this.gpt33,
    required this.similarTools,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        title: json["title"],
        category: List<String>.from(json["category"].map((x) => x)),
        semrushRank: json["semrush_rank"],
        datetime: json["datetime"],
        link: json["link"],
        favouriteCount: json["favourite_count"],
        whois: DataWhois.fromJson(json["whois"]),
        pricing: Pricing.fromJson(json["pricing"]),
        techUsed: List<String>.from(json["tech_used"].map((x) => x)),
        video: json["video"],
        gpt33: DataGpt33.fromJson(json["gpt33"]),
        similarTools: List<String>.from(json["similar_tools"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "category": List<dynamic>.from(category.map((x) => x)),
        "semrush_rank": semrushRank,
        "datetime": datetime,
        "link": link,
        "favourite_count": favouriteCount,
        "whois": whois.toJson(),
        "pricing": pricing.toJson(),
        "tech_used": List<dynamic>.from(techUsed.map((x) => x)),
        "video": video,
        "gpt33": gpt33.toJson(),
        "similar_tools": List<dynamic>.from(similarTools.map((x) => x)),
      };
}

class DataGpt33 {
  String title;
  String description;
  List<Feature> features;
  List<Feature> usecases;
  String conclusion;
  String heading;

  DataGpt33({
    required this.title,
    required this.description,
    required this.features,
    required this.usecases,
    required this.conclusion,
    required this.heading,
  });

  factory DataGpt33.fromRawJson(String str) =>
      DataGpt33.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataGpt33.fromJson(Map<String, dynamic> json) => DataGpt33(
        title: json["title"],
        description: json["description"],
        features: List<Feature>.from(
            json["features"].map((x) => Feature.fromJson(x))),
        usecases: List<Feature>.from(
            json["usecases"].map((x) => Feature.fromJson(x))),
        conclusion: json["conclusion"],
        heading: json["heading"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "features": List<dynamic>.from(features.map((x) => x.toJson())),
        "usecases": List<dynamic>.from(usecases.map((x) => x.toJson())),
        "conclusion": conclusion,
        "heading": heading,
      };
}

class Feature {
  String heading;
  String description;

  Feature({
    required this.heading,
    required this.description,
  });

  factory Feature.fromRawJson(String str) => Feature.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        heading: json["heading"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "heading": heading,
        "description": description,
      };
}

class Pricing {
  String price;
  String type;

  Pricing({
    required this.price,
    required this.type,
  });

  factory Pricing.fromRawJson(String str) => Pricing.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pricing.fromJson(Map<String, dynamic> json) => Pricing(
        price: json["price"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "type": type,
      };
}

class DataWhois {
  String city;
  String country;
  String creationDate;

  DataWhois({
    required this.city,
    required this.country,
    required this.creationDate,
  });

  factory DataWhois.fromRawJson(String str) =>
      DataWhois.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataWhois.fromJson(Map<String, dynamic> json) => DataWhois(
        city: json["city"],
        country: json["country"],
        creationDate: json["creation_date"],
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "country": country,
        "creation_date": creationDate,
      };
}

class Meta {
  String title;
  String description;
  String canonical;

  Meta({
    required this.title,
    required this.description,
    required this.canonical,
  });

  factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        title: json["title"],
        description: json["description"],
        canonical: json["canonical"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "canonical": canonical,
      };
}

class RelatedTool {
  String id;
  String title;
  List<String> category;
  bool thumbnailExists;
  String link;
  int favouriteCount;
  RelatedToolWhois whois;
  Pricing pricing;
  String video;
  RelatedToolGpt33 gpt33;

  RelatedTool({
    required this.id,
    required this.title,
    required this.category,
    required this.thumbnailExists,
    required this.link,
    required this.favouriteCount,
    required this.whois,
    required this.pricing,
    required this.video,
    required this.gpt33,
  });

  factory RelatedTool.fromRawJson(String str) =>
      RelatedTool.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RelatedTool.fromJson(Map<String, dynamic> json) => RelatedTool(
        id: json["_id"],
        title: json["title"],
        category: List<String>.from(json["category"].map((x) => x)),
        thumbnailExists: json["thumbnail_exists"],
        link: json["link"],
        favouriteCount: json["favourite_count"],
        whois: RelatedToolWhois.fromJson(json["whois"]),
        pricing: Pricing.fromJson(json["pricing"]),
        video: json["video"],
        gpt33: RelatedToolGpt33.fromJson(json["gpt33"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "category": List<dynamic>.from(category.map((x) => x)),
        "thumbnail_exists": thumbnailExists,
        "link": link,
        "favourite_count": favouriteCount,
        "whois": whois.toJson(),
        "pricing": pricing.toJson(),
        "video": video,
        "gpt33": gpt33.toJson(),
      };
}

class RelatedToolGpt33 {
  String heading;

  RelatedToolGpt33({
    required this.heading,
  });

  factory RelatedToolGpt33.fromRawJson(String str) =>
      RelatedToolGpt33.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RelatedToolGpt33.fromJson(Map<String, dynamic> json) =>
      RelatedToolGpt33(
        heading: json["heading"],
      );

  Map<String, dynamic> toJson() => {
        "heading": heading,
      };
}

class RelatedToolWhois {
  String creationDate;

  RelatedToolWhois({
    required this.creationDate,
  });

  factory RelatedToolWhois.fromRawJson(String str) =>
      RelatedToolWhois.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RelatedToolWhois.fromJson(Map<String, dynamic> json) =>
      RelatedToolWhois(
        creationDate: json["creation_date"],
      );

  Map<String, dynamic> toJson() => {
        "creation_date": creationDate,
      };
}
