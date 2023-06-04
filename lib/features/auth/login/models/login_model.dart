import 'package:ads/features/auth/login/models/user_model.dart';

class LoginModel {
  User? user;
  String? accessToken;

  LoginModel({required this.user,required this.accessToken});

  LoginModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    accessToken = json['access_token'];
  }

}


