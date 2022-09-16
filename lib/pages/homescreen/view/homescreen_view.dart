import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../controller/homescreen_controller.dart';
import 'package:sizer/sizer.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            TextField(
              controller: controller.name,
            ),
            TextField(
              controller: controller.age,
            ),
            TextField(
              controller: controller.address,
            ),
            SizedBox(
              height: 3.h,
            ),
            TextButton(
                onPressed: () {
                  controller.insertData();
                },
                child: Text("Add")),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
                child: SizedBox(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.dataList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.all(1.h),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Name: ",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(controller.dataList[index].name),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Age: ",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(controller.dataList[index].age),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Address: ",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(controller.dataList[index].address),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
