import 'package:guidealt/domain/entities/user.dart';

class Category {
  int id;
  String description;
  bool isMandatoryReference;
  User? user;

  Category({
    this.id = -1,
    required this.description,
    required this.isMandatoryReference,
    this.user,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "description": description,
      "isMandatoryReference": isMandatoryReference,
      "user": user?.toJson()
    };
  }

  Map<String, dynamic> toSqlJson() {
    return {
      "id": id,
      "description": description,
      "isMandatoryReference": isMandatoryReference,
      "idUser": user?.id
    };
  }

  static Category fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      description: json["description"], 
      isMandatoryReference: json["isMandatoryReference"],
      user: User.fromJson(json["user"])
    );
  }

  static Category fromSqlJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      description: json["description"], 
      isMandatoryReference: json["isMandatoryReference"] == 1 ? true : false, 
      user: null
    );
  }

  @override
  String toString() {
    return "Category(id: $id, description: $description, isMandatoryReference: $isMandatoryReference)";
  }

}