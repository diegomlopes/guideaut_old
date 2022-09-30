import 'package:guidealt/domain/entities/recomendation.dart';

class RecomendationRating {
  int id;
  Recomendation recomendation;
  double value;

  RecomendationRating({
    this.id = -1,
    required this.recomendation,
    required this.value
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "recomendation": recomendation.toJson(),
      "value": value
    };
  }

  Map<String, dynamic> toSqlJson() {
    return {
      "id": id,
      "recomendation": recomendation.toJson(),
      "value": value
    };
  }

  static RecomendationRating fromJson(Map<String, dynamic> json) {
    return RecomendationRating(
      id: json["id"],
      recomendation: Recomendation.fromJson(json["user"]),
      value: json["value"],
    );
  }
  
  @override
  String toString() {
    return "RecomendationRating(id: $id, recomendation: $recomendation, value: $value)";
  }
}