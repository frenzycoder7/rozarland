class ProfileData {
  int? id;
  int? userId;
  String? name;
  String? email;
  String? mobile;
  String? gender;
  String? image;
  String? address;
  String? pin;
  int? status;
  String? createdAt;
  String? updatedAt;

  ProfileData(
      {this.id,
      this.userId,
      this.name,
      this.email,
      this.mobile,
      this.gender,
      this.image,
      this.address,
      this.pin,
      this.status,
      this.createdAt,
      this.updatedAt});

  ProfileData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    gender = json['gender'];
    image = json['image'];
    address = json['address'];
    pin = json['pin'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['gender'] = gender;
    data['image'] = image;
    data['address'] = address;
    data['pin'] = pin;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
