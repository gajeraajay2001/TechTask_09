import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_exam_09/app/constant/color_constant.dart';
import 'package:tech_exam_09/app/constant/sizeConstant.dart';
import 'package:tech_exam_09/app/uitilities/text_field.dart';
import 'package:tech_exam_09/model/info_model.dart';

import '../controllers/personal_info_controller.dart';

class PersonalInfoView extends GetWidget<PersonalInfoController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          body: (controller.hasData.isFalse)
              ? Center(
                  child:
                      CircularProgressIndicator(color: appTheme.primaryTheme),
                )
              : SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: MySize.getScaledSizeHeight(20),
                        horizontal: MySize.getScaledSizeHeight(10)),
                    child: Form(
                      key: controller.key,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "Personal Information",
                              style: TextStyle(
                                  fontSize: MySize.getScaledSizeHeight(26),
                                  color: appTheme.primaryTheme,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: MySize.getScaledSizeHeight(10)),
                          Text(
                            "First Name",
                            style: TextStyle(
                                fontSize: MySize.getScaledSizeHeight(22),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: MySize.getScaledSizeHeight(10)),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: MySize.getScaledSizeWidth(10),
                            ),
                            height: MySize.getScaledSizeHeight(65),
                            child: getTextFormField(
                                controller:
                                    controller.firstNameController.value,
                                textInputAction: TextInputAction.next,
                                hintText: "Enter First Name*",
                                validation: (val) {
                                  if (isNullEmptyOrFalse(val)) {
                                    return "Please enter first name.";
                                  }
                                  return null;
                                }),
                          ),
                          SizedBox(height: MySize.getScaledSizeHeight(20)),
                          Text(
                            "Last Name",
                            style: TextStyle(
                                fontSize: MySize.getScaledSizeHeight(22),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: MySize.getScaledSizeHeight(10)),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: MySize.getScaledSizeWidth(10),
                            ),
                            height: MySize.getScaledSizeHeight(65),
                            child: getTextFormField(
                                controller: controller.lastNameController.value,
                                hintText: "Enter Last Name*",
                                textInputAction: TextInputAction.next,
                                validation: (val) {
                                  if (isNullEmptyOrFalse(val)) {
                                    return "Please enter last name.";
                                  }
                                  return null;
                                }),
                          ),
                          SizedBox(height: MySize.getScaledSizeHeight(10)),
                          Text(
                            "Gender",
                            style: TextStyle(
                                fontSize: MySize.getScaledSizeHeight(22),
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: "Male",
                                  groupValue: controller.radioVal.value,
                                  activeColor: appTheme.primaryTheme,
                                  onChanged: (val) {
                                    controller.radioVal.value = val.toString();
                                  }),
                              Text("Male",
                                  style: TextStyle(
                                      fontSize: MySize.getScaledSizeHeight(20),
                                      fontWeight: FontWeight.bold)),
                              Radio(
                                  value: "Female",
                                  activeColor: appTheme.primaryTheme,
                                  groupValue: controller.radioVal.value,
                                  onChanged: (val) {
                                    controller.radioVal.value = val.toString();
                                  }),
                              Text("Female",
                                  style: TextStyle(
                                      fontSize: MySize.getScaledSizeHeight(20),
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SizedBox(height: MySize.getScaledSizeHeight(20)),
                          Text(
                            "Age",
                            style: TextStyle(
                                fontSize: MySize.getScaledSizeHeight(22),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: MySize.getScaledSizeHeight(10)),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: MySize.getScaledSizeWidth(10),
                            ),
                            height: MySize.getScaledSizeHeight(65),
                            child: getTextFormField(
                                controller: controller.ageController.value,
                                textInputType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                hintText: "Enter Age*",
                                validation: (val) {
                                  if (isNullEmptyOrFalse(val)) {
                                    return "Please enter age.";
                                  }
                                  return null;
                                }),
                          ),
                          SizedBox(height: MySize.getScaledSizeHeight(30)),
                          Center(
                            child: Text(
                              "Residential Information",
                              style: TextStyle(
                                  fontSize: MySize.getScaledSizeHeight(26),
                                  color: appTheme.primaryTheme,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: MySize.getScaledSizeHeight(20)),
                          Text(
                            "Street Number",
                            style: TextStyle(
                                fontSize: MySize.getScaledSizeHeight(22),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: MySize.getScaledSizeHeight(10)),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: MySize.getScaledSizeWidth(10),
                            ),
                            height: MySize.getScaledSizeHeight(65),
                            child: getTextFormField(
                                controller: controller.streetNoController.value,
                                textInputType: TextInputType.number,
                                hintText: "Enter Street Number*",
                                textInputAction: TextInputAction.next,
                                validation: (val) {
                                  if (isNullEmptyOrFalse(val)) {
                                    return "Please enter street number.";
                                  }
                                  return null;
                                }),
                          ),
                          SizedBox(height: MySize.getScaledSizeHeight(20)),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: MySize.getScaledSizeWidth(10),
                            ),
                            height: MySize.getScaledSizeHeight(65),
                            child: InkWell(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                openCountryDialog(context: context);
                              },
                              child: getTextFormField(
                                  enable: false,
                                  controller:
                                      controller.countryController.value,
                                  hintText: "Please select country*",
                                  validation: (val) {
                                    if (isNullEmptyOrFalse(val)) {
                                      return "Please select country.";
                                    }
                                    return null;
                                  }),
                            ),
                          ),
                          SizedBox(height: MySize.getScaledSizeHeight(20)),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: MySize.getScaledSizeWidth(10),
                            ),
                            height: MySize.getScaledSizeHeight(65),
                            child: InkWell(
                              onTap: () {
                                FocusScope.of(context).unfocus();

                                openCityDialog(context: context);
                              },
                              child: getTextFormField(
                                  enable: false,
                                  controller: controller.cityController.value,
                                  hintText: "Please select city",
                                  validation: (val) {
                                    if (isNullEmptyOrFalse(val)) {
                                      return "Please select city.";
                                    }
                                    return null;
                                  }),
                            ),
                          ),
                          SizedBox(height: MySize.getScaledSizeHeight(20)),
                          Center(
                            child: InkWell(
                              onTap: () {
                                if (controller.key.currentState!.validate()) {
                                  submitData();
                                }
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  height: MySize.getScaledSizeHeight(55),
                                  width: MySize.getScaledSizeWidth(350),
                                  decoration: BoxDecoration(
                                    color: appTheme.primaryTheme,
                                    borderRadius: BorderRadius.circular(
                                        MySize.getScaledSizeHeight(10)),
                                  ),
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MySize.getScaledSizeHeight(22)),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        );
      }),
    );
  }

  submitData() {
    List listOfMap = [];

    Map<String, String> data = {
      "id": DateTime.now().toString(),
      "fName": (isNullEmptyOrFalse(controller.firstNameController.value.text))
          ? "NA"
          : controller.firstNameController.value.text,
      "lName": (isNullEmptyOrFalse(controller.lastNameController.value.text))
          ? "NA"
          : controller.lastNameController.value.text,
      "age": (isNullEmptyOrFalse(controller.ageController.value.text))
          ? "NA"
          : controller.ageController.value.text,
      "city": (isNullEmptyOrFalse(controller.cityController.value.text))
          ? "NA"
          : controller.cityController.value.text,
      "country": (isNullEmptyOrFalse(controller.countryController.value.text))
          ? "NA"
          : controller.countryController.value.text,
      "gender": controller.radioVal.value,
      "state": "surat",
      "streetNo": (isNullEmptyOrFalse(controller.streetNoController.value.text))
          ? "NA"
          : controller.streetNoController.value.text
    };

    GetStorage box = GetStorage();
    if (!isNullEmptyOrFalse(box.read("data"))) {
      listOfMap = box.read("data");
    }
    listOfMap.add(data);
    controller.homeScreenController.data.add(InfoData.fromJson(data));
    controller.homeScreenController.refresh();
    box.write("data", listOfMap);
    Get.back();
  }

  openCountryDialog({required BuildContext context}) {
    return Get.defaultDialog(
      title: "Select Country",
      content: Container(
        height: MySize.getScaledSizeHeight(500),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  controller.countryController.value.text =
                      controller.countryList[index];
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MySize.getScaledSizeWidth(10),
                      vertical: MySize.getScaledSizeHeight(5)),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(MySize.getScaledSizeHeight(5)),
                      color: appTheme.primaryTheme.withOpacity(0.2)),
                  child: Text(controller.countryList[index]),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: MySize.getScaledSizeHeight(10),
              );
            },
            itemCount: controller.countryList.length),
      ),
    );
  }

  openCityDialog({required BuildContext context}) {
    return Get.defaultDialog(
      title: "Select City",
      content: Container(
        height: MySize.getScaledSizeHeight(
            (isNullEmptyOrFalse(controller.city)) ? 60 : 500),
        child: (isNullEmptyOrFalse(controller.city))
            ? Center(
                child: Text("No Data Available"),
              )
            : ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      controller.cityController.value.text =
                          controller.city[index];
                      Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: MySize.getScaledSizeWidth(10),
                          vertical: MySize.getScaledSizeHeight(5)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              MySize.getScaledSizeHeight(5)),
                          color: appTheme.primaryTheme.withOpacity(0.2)),
                      child: Text(controller.city[index]),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: MySize.getScaledSizeHeight(10),
                  );
                },
                itemCount: controller.city.length),
      ),
    );
  }
}
