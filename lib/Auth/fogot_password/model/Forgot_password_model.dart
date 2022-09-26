class ForgotPasswordResponseModel {
  int? status;
  String? msg;
  String? userId;

  ForgotPasswordResponseModel({this.status, this.msg, this.userId});

  ForgotPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    data['userId'] = userId;
    return data;
  }
}
