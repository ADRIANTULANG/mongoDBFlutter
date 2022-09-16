import 'dart:convert';

List<ClientHomeModel> clientHomeModelFromJson(String str) =>
    List<ClientHomeModel>.from(
        json.decode(str).map((x) => ClientHomeModel.fromJson(x)));

String clientHomeModelToJson(List<ClientHomeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClientHomeModel {
  ClientHomeModel({
    required this.id,
    required this.name,
    required this.age,
    required this.address,
  });

  String id;
  String name;
  String age;
  String address;

  factory ClientHomeModel.fromJson(Map<String, dynamic> json) =>
      ClientHomeModel(
        id: json["_id"],
        name: json["name"],
        age: json["age"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "age": age,
        "address": address,
      };
}
