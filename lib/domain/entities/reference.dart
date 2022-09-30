import 'package:guidealt/domain/entities/recomendation.dart';

class Reference {
  int id;
  String description;
  String link;
  String doi;
  Recomendation recomendation;

  Reference({
    this.id = -1,
    required this.description,
    required this.link,
    required this.recomendation,
    this.doi = "",
  });

  Map<String, dynamic> toJson() {
    return {
      "description": description,
      "link": link,
      "doi": doi
    };
  }

  Map<String, dynamic> toSqlJson() {
    return {
      "id": id,
      "description": description,
      "link": link,
      "doi": doi
    };
  }

  static Reference fromJson(Map<String, dynamic> json) {
    return Reference(
      id: json["id"],
      description: json["description"], 
      link: json["link"],
      recomendation: Recomendation.fromJson(json["recomendation"]),
      doi: json["doi"]
    );
  }

  @override
  String toString() {
    return "Reference(id: $id, description: $description)";
  }
  
}