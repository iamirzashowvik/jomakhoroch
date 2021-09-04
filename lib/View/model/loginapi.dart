// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  Data data;
  String message;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.apiToken,
    required this.deviceToken,
    this.stripeId,
    this.cardBrand,
    this.cardLastFour,
    this.trialEndsAt,
    this.braintreeId,
    this.paypalEmail,
    required this.createdAt,
    required this.updatedAt,
    required this.customFields,
    required this.hasMedia,
    required this.media,
  });

  int id;
  String name;
  String email;
  String apiToken;
  String deviceToken;
  dynamic stripeId;
  dynamic cardBrand;
  dynamic cardLastFour;
  dynamic trialEndsAt;
  dynamic braintreeId;
  dynamic paypalEmail;
  DateTime createdAt;
  DateTime updatedAt;
  CustomFields customFields;
  bool hasMedia;
  List<dynamic> media;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        apiToken: json["api_token"],
        deviceToken: json["device_token"],
        stripeId: json["stripe_id"],
        cardBrand: json["card_brand"],
        cardLastFour: json["card_last_four"],
        trialEndsAt: json["trial_ends_at"],
        braintreeId: json["braintree_id"],
        paypalEmail: json["paypal_email"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        customFields: CustomFields.fromJson(json["custom_fields"]),
        hasMedia: json["has_media"],
        media: List<dynamic>.from(json["media"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "api_token": apiToken,
        "device_token": deviceToken,
        "stripe_id": stripeId,
        "card_brand": cardBrand,
        "card_last_four": cardLastFour,
        "trial_ends_at": trialEndsAt,
        "braintree_id": braintreeId,
        "paypal_email": paypalEmail,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "custom_fields": customFields.toJson(),
        "has_media": hasMedia,
        "media": List<dynamic>.from(media.map((x) => x)),
      };
}

class CustomFields {
  CustomFields({
    required this.phone,
    required this.bio,
    required this.address,
  });

  Address phone;
  Address bio;
  Address address;

  factory CustomFields.fromJson(Map<String, dynamic> json) => CustomFields(
        phone: Address.fromJson(json["phone"]),
        bio: Address.fromJson(json["bio"]),
        address: Address.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "phone": phone.toJson(),
        "bio": bio.toJson(),
        "address": address.toJson(),
      };
}

class Address {
  Address({
    required this.value,
    required this.view,
    required this.name,
  });

  String value;
  String view;
  String name;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        value: json["value"] == null ? null : json["value"],
        view: json["view"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "value": value == null ? null : value,
        "view": view,
        "name": name,
      };
}
