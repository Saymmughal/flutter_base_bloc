import 'package:flutter_base_bloc/utils/app_strings.dart';

class LoginModel {
  String? error;
  bool? success;
  String? token;
  LoginData? data;

  LoginModel({this.error, this.success, this.token, this.data});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    error: json[AppStrings.errorField],
    success: json[AppStrings.successField],
    token: json[AppStrings.tokenField],
    data: json[AppStrings.dataField] == null
        ? null
        : LoginData.fromJson(json[AppStrings.dataField]),
  );

  Map<String, dynamic> toJson() => {
    AppStrings.errorField: error,
    AppStrings.successField: success,
    AppStrings.tokenField: token,
    AppStrings.dataField: data?.toJson(),
  };
}

class LoginData {
  int? id;
  String? name;
  String? email;
  String? role;
  bool? verified;
  bool? active;
  int? subExpiresAt;
  bool? isAdmin;
  int? cloudBalance;
  int? couponExpiresAt;
  int? createdAt;

  LoginData({
    this.id,
    this.name,
    this.email,
    this.role,
    this.verified,
    this.active,
    this.subExpiresAt,
    this.isAdmin,
    this.cloudBalance,
    this.couponExpiresAt,
    this.createdAt,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
    id: json["_id"],
    name: json[AppStrings.nameField],
    email: json[AppStrings.emailField],
    role: json[AppStrings.roleField],
    verified: json[AppStrings.verifiedField],
    active: json[AppStrings.activeField],
    subExpiresAt: json["sub_expires_at"],
    isAdmin: json["is_admin"],
    cloudBalance: json["cloud_balance"],
    couponExpiresAt: json["coupon_expires_at"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    AppStrings.nameField: name,
    AppStrings.emailField: email,
    AppStrings.roleField: role,
    AppStrings.verifiedField: verified,
    AppStrings.activeField: active,
    "sub_expires_at": subExpiresAt,
    "is_admin": isAdmin,
    "cloud_balance": cloudBalance,
    "coupon_expires_at": couponExpiresAt,
    "created_at": createdAt,
  };
}
