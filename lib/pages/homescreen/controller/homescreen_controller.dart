import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../database/mongo_database_config.dart';
import '../model/homescreen_model.dart';

class HomeScreenController extends GetxController {
  @override
  void onInit() async {
    getListAndReviews();
    super.onInit();
  }

  RxList<ClientHomeModel> dataList = <ClientHomeModel>[].obs;

  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController address = TextEditingController();

  @override
  void onClose() {
    super.onClose();
  }

  getListAndReviews() async {
    try {
      dataList.assignAll(await DatabaseController.getData());
    } on Exception catch (e) {
      print(e);
    }
  }

  insertData() async {
    try {
      var result = await DatabaseController.createDocument(
          name: name.text, age: age.text, address: address.text);
      print(result);
      if (result == true) {
        getListAndReviews();
        name.clear();
        age.clear();
        address.clear();
      } else {}
    } catch (e) {}
  }
}
