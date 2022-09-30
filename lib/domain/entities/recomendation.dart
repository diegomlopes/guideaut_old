import 'package:guidealt/domain/entities/category.dart';
import 'package:guidealt/domain/entities/reference.dart';
import 'package:guidealt/domain/entities/user.dart';

class Recomendation {
  int id;
  String title;
  String plainText;
  List<Category> categories;
  List<Reference> references;
  User user;

  Recomendation({
    this.id = -1,
    required this.title,
    required this.plainText,
    required this.categories,
    required this.references,
    required this.user,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "plainText": plainText,
      "categories": categories.map((e) => e.toJson()).toList(),
      "references": references.map((e) => e.toJson()).toList(),
      "user": user.toJson()
    };
  }

  Map<String, dynamic> toSqlJson() {
    return {
      "id": id,
      "title": title,
      "plainText": plainText,
      "categories": categories.map((e) => e.id).toList(),
      "references": references.map((e) => e.toSqlJson()).toList(),
      "user": user.toJson()
    };
  }

  static Recomendation fromJson(Map<String, dynamic> json) {
    return Recomendation(
      id: json["id"],
      title: json["title"],
      plainText: json["plainText"], 
      categories: json["categories"].map((e) => Category.fromJson(e)) as List<Category>,
      references: json["references"].map((e) => Reference.fromJson(e)) as List<Reference>,
      user: User.fromJson(json["user"])
    );
  }
  
  @override
  String toString() {
    return "Recomendation(id: $id, user: $user, categories: $categories, references: $references)";
  }
}