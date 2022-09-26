class LoginResponseModel {
  int? status;
  String? message;
  User? user;

  LoginResponseModel({this.status, this.message, this.user});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? userName;
  String? userProgram;
  String? address;
  String? bio;
  String? userEmail;
  String? userPassword;
  String? image;
  int? code;
  int? verified;
  String? userAuthentication;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? latitude;
  String? longitude;
  String? userDeviceToken;
  String? userDeviceType;

  User(
      {this.sId,
      this.userName,
      this.userProgram,
      this.address,
      this.bio,
      this.userEmail,
      this.userPassword,
      this.image,
      this.code,
      this.verified,
      this.userAuthentication,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.latitude,
      this.longitude,
      this.userDeviceToken,
      this.userDeviceType});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['user_name'];
    userProgram = json['user_program'];
    address = json['address'];
    bio = json['bio'];
    userEmail = json['user_email'];
    userPassword = json['user_password'];
    image = json['image'];
    code = json['code'];
    verified = json['verified'];
    userAuthentication = json['user_authentication'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    userDeviceToken = json['user_device_token'];
    userDeviceType = json['user_device_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user_name'] = this.userName;
    data['user_program'] = this.userProgram;
    data['address'] = this.address;
    data['bio'] = this.bio;
    data['user_email'] = this.userEmail;
    data['user_password'] = this.userPassword;
    data['image'] = this.image;
    data['code'] = this.code;
    data['verified'] = this.verified;
    data['user_authentication'] = this.userAuthentication;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['user_device_token'] = this.userDeviceToken;
    data['user_device_type'] = this.userDeviceType;
    return data;
  }
}
