import 'package:flutter/material.dart';

import 'dart:convert';

UserDetailsModel userDetailsModelFromJson(String str) =>
    UserDetailsModel.fromJson(json.decode(str));

String userDetailsModelToJson(UserDetailsModel data) =>
    json.encode(data.toJson());

class UserDetailsModel {
  UserDetailsModel({
    this.message,
    this.publiccards,
  });

  String? message;
  List<Publiccard>? publiccards;

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) =>
      UserDetailsModel(
        message: json["message"],
        publiccards: List<Publiccard>.from(
            json["publiccards"].map((x) => Publiccard.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "publiccards": List<dynamic>.from(publiccards!.map((x) => x.toJson())),
      };
}

class Publiccard {
  Publiccard({
    this.services,
    this.id,
    this.name,
    this.position,
    this.userphone,
    this.email,
    this.website,
    this.company,
    this.address,
    this.phonenumber,
    this.visible,
    this.public,
    this.profilepic,
    this.publiccardId,
    this.date,
    this.v,
    this.vcard,
  });

  List<Service>? services;
  String? id;
  String? name;
  String? position;
  String? userphone;
  String? email;
  String? website;
  String? company;
  String? address;
  String? phonenumber;
  String? visible;
  String? public;
  String? profilepic;
  String? publiccardId;
  DateTime? date;
  int? v;
  String? vcard;

  factory Publiccard.fromJson(Map<String, dynamic> json) => Publiccard(
        services: List<Service>.from(
            json["services"].map((x) => Service.fromJson(x))),
        id: json["_id"],
        name: json["name"],
        position: json["position"],
        userphone: json["userphone"],
        email: json["email"],
        website: json["website"],
        company: json["company"],
        address: json["address"],
        phonenumber: json["phonenumber"],
        visible: json["visible"],
        public: json["public"],
        profilepic: json["profilepic"],
        publiccardId: json["id"],
        date: DateTime.parse(json["date"]),
        v: json["__v"],
        vcard: json["vcard"],
      );

  Map<String, dynamic> toJson() => {
        "services": List<dynamic>.from(services!.map((x) => x.toJson())),
        "_id": id,
        "name": name,
        "position": position,
        "userphone": userphone,
        "email": email,
        "website": website,
        "company": company,
        "address": address,
        "phonenumber": phonenumber,
        "visible": visible,
        "public": public,
        "profilepic": profilepic,
        "id": publiccardId,
        "date": date!.toIso8601String(),
        "__v": v,
        "vcard": vcard,
      };
}

class Service {
  Service({
    this.id,
    this.servicename,
    this.description,
    this.image1,
    this.image2,
    this.visible,
    this.cardid,
    this.date,
    this.v,
  });

  String? id;
  String? servicename;
  String? description;
  String? image1;
  String? image2;
  String? visible;
  String? cardid;
  DateTime? date;
  int? v;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["_id"],
        servicename: json["servicename"],
        description: json["description"],
        image1: json["image1"],
        image2: json["image2"],
        visible: json["visible"],
        cardid: json["cardid"],
        date: DateTime.parse(json["date"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "servicename": servicename,
        "description": description,
        "image1": image1,
        "image2": image2,
        "visible": visible,
        "cardid": cardid,
        "date": date!.toIso8601String(),
        "__v": v,
      };
}
