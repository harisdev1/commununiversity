class SignupResponse {
  int? status;
  String? msg;
  User? user;

  SignupResponse({this.status, this.msg, this.user});

  SignupResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? userName;
  String? userProgram;
  String? address;
  String? bio;
  String? userEmail;
  String? userPassword;
  String? image;
  int? code;
  int? verified;
  String? sId;
  String? userAuthentication;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {this.userName,
      this.userProgram,
      this.address,
      this.bio,
      this.userEmail,
      this.userPassword,
      this.image,
      this.code,
      this.verified,
      this.sId,
      this.userAuthentication,
      this.createdAt,
      this.updatedAt,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    userProgram = json['user_program'];
    address = json['address'];
    bio = json['bio'];
    userEmail = json['user_email'];
    userPassword = json['user_password'];
    image = json['image'];
    code = json['code'];
    verified = json['verified'];
    sId = json['_id'];
    userAuthentication = json['user_authentication'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_name'] = this.userName;
    data['user_program'] = this.userProgram;
    data['address'] = this.address;
    data['bio'] = this.bio;
    data['user_email'] = this.userEmail;
    data['user_password'] = this.userPassword;
    data['image'] = this.image;
    data['code'] = this.code;
    data['verified'] = this.verified;
    data['_id'] = this.sId;
    data['user_authentication'] = this.userAuthentication;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
