class User {
  int id;
  String firstName;
  String secondName;
  String email;
  String password;
  int type;

  User({
    this.id = -1,
    required this.firstName,
    required this.secondName,
    required this.email,
    required this.password,
    required this.type
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "firstName": firstName,
      "secondName": secondName,
      "email": email,
      "password": password,
      "type": type,
    };
  }

  static User fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      firstName: json["firstName"], 
      secondName: json["secondName"], 
      email: json["email"], 
      password: json["password"], 
      type: json["type"], 
    );
  }

  @override
  String toString() {
    return "User(id: $id, email: $email)";
  }
}