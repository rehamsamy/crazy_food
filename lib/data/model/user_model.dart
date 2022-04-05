class UserModel {
  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.gender,
    this.birthDate,
    this.apiToken
  });

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    gender = json['gender'];
    birthDate = json['birthDate'];
    apiToken = json['api_token'];
  }

  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? gender;
  String? birthDate;
  String? apiToken;
  dynamic verifyToken;
  dynamic emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['image'] = image;
    map['gender'] = gender;
    map['birthDate'] = birthDate;
    map['api_token'] = apiToken;
    map['verify_token'] = verifyToken;
    map['email_verified_at'] = emailVerifiedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
