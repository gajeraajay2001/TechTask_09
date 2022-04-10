import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_exam_09/app/constant/color_constant.dart';
import 'package:tech_exam_09/app/routes/app_pages.dart';
import 'package:tech_exam_09/model/info_model.dart';

import '../../../constant/sizeConstant.dart';
import '../controllers/home_screen_controller.dart';

class HomeScreenView extends GetWidget<HomeScreenController> {
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: appTheme.primaryTheme,
            title: Text('HomeScreenView'),
            centerTitle: true,
          ),
          body: (controller.hasData.isFalse)
              ? Center(
                  child:
                      CircularProgressIndicator(color: appTheme.primaryTheme),
                )
              : (isNullEmptyOrFalse(controller.data))
                  ? Center(
                      child: Text(
                        "No Data Available.....",
                        style: TextStyle(
                            fontSize: MySize.getScaledSizeHeight(20),
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  : Container(
                      height: MySize.safeHeight,
                      width: MySize.safeWidth,
                      padding: EdgeInsets.symmetric(
                          horizontal: MySize.getScaledSizeWidth(10),
                          vertical: MySize.getScaledSizeHeight(20)),
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: MySize.getScaledSizeHeight(10),
                                  horizontal: MySize.getScaledSizeWidth(20)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  MySize.getScaledSizeHeight(5),
                                ),
                                border: Border.all(
                                  color: appTheme.primaryTheme,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          getTitle(
                                              text2: controller
                                                  .data[index].fName
                                                  .toString(),
                                              text1: "First Name :"),
                                          getTitle(
                                              text2: controller
                                                  .data[index].lName
                                                  .toString(),
                                              text1: "Last Name :"),
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller.deleteData(
                                              id: controller.data[index].id
                                                  .toString());
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                  getTitle(
                                      text2: controller.data[index].gender
                                          .toString(),
                                      text1: "Gender :"),
                                  getTitle(
                                      text2:
                                          controller.data[index].age.toString(),
                                      text1: "Age :"),
                                  getTitle(
                                      text2: controller.data[index].streetNo
                                          .toString(),
                                      text1: "Street No. :"),
                                  getTitle(
                                      text2: controller.data[index].country
                                          .toString(),
                                      text1: "Country :"),
                                  // getTitle(
                                  //     text2:
                                  //         controller.data[index].state.toString(),
                                  //     text1: "State :"),
                                  getTitle(
                                      text2: controller.data[index].city
                                          .toString(),
                                      text1: "City :"),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: MySize.getScaledSizeHeight(10),
                            );
                          },
                          itemCount: controller.data.length),
                    ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: appTheme.primaryTheme,
            onPressed: () {
              GetStorage box = GetStorage();

              print(box.read("data"));
              Get.toNamed(Routes.PERSONAL_INFO);
            },
            heroTag: "a1",
            child: Icon(Icons.add),
          ),
        );
      }),
    );
  }

  getTitle({
    required String text1,
    required String text2,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              text1,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MySize.getScaledSizeHeight(20)),
            ),
            Text(
              text2[0].toUpperCase() + text2.substring(1).toLowerCase(),
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: MySize.getScaledSizeHeight(18)),
            ),
          ],
        ),
        SizedBox(height: MySize.getScaledSizeHeight(5)),
      ],
    );
  }
}
