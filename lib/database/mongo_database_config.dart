import 'dart:convert';

import 'package:mongodbcrud/constant/constants.dart';
import 'package:mongo_dart/mongo_dart.dart';

import '../pages/homescreen/model/homescreen_model.dart';

class DatabaseController {
  static Db? database;
  static DbCollection? listandreviewCollection;
  static connect() async {
    database = await Db.create(connectionString);
    await database!.open();
    listandreviewCollection =
        await database!.collection(collection_list_and_review_string);
  }

  static Future<List<ClientHomeModel>> getData() async {
    try {
      var datas = await listandreviewCollection!.find().toList();
      var jsonEncodeString = jsonEncode(datas);
      return clientHomeModelFromJson(jsonEncodeString);
    } on Exception catch (e) {
      print(e);
      return [];
    }
  }

  static Future<bool> createDocument({
    required String name,
    required String age,
    required String address,
  }) async {
    print(name);
    print(age);
    print(address);
    var id = ObjectId();
    var objectString = {
      "_id": id.$oid.toString(),
      "name": name,
      "age": age,
      "address": address
    };

    var result = await listandreviewCollection!.insertOne(objectString);
    return result.isSuccess;
  }
}
