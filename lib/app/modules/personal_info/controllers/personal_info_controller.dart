import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_exam_09/app/constant/sizeConstant.dart';
import 'package:tech_exam_09/app/modules/home_screen/controllers/home_screen_controller.dart';
import 'package:tech_exam_09/app/uitilities/dialoges.dart';
import 'package:tech_exam_09/model/city_model.dart';

import '../views/personal_info_view.dart';

class PersonalInfoController extends GetxController {
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  GlobalKey<FormState> key = GlobalKey<FormState>();
  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<TextEditingController> lastNameController = TextEditingController().obs;
  Rx<TextEditingController> sexController = TextEditingController().obs;
  Rx<TextEditingController> ageController = TextEditingController().obs;
  Rx<TextEditingController> streetNoController = TextEditingController().obs;
  Rx<TextEditingController> cityController = TextEditingController().obs;
  Rx<TextEditingController> stateController = TextEditingController().obs;
  Rx<TextEditingController> countryController = TextEditingController().obs;
  RxList<String> countryList = RxList<String>([]);
  RxString radioVal = "Male".obs;
  RxList<String> city = RxList<String>([]);
  RxBool hasData = false.obs;
  GetStorage box = GetStorage();
  @override
  void onInit() {
    if (box.read("countryList") != null) {
      List data = box.read("countryList");
      data.forEach((element) {
        countryList.add(element);
      });
    } else {
      getCountry();
    }
    if (box.read("cityList") != null) {
      hasData.value = true;
      List data = box.read("cityList");
      data.forEach((element) {
        city.add(element);
      });
    } else {
      getCity();
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  getCountry() async {
    Dio dio = Dio();
    dio.options.headers['X-RapidAPI-Key'] =
        '8bc41a76dcmsh771a23e5e6a7a21p101d01jsn5d4b64f99662';
    dio.options.headers["X-RapidAPI-Host"] = "countries-cities.p.rapidapi.com";
    await dio
        .get("https://countries-cities.p.rapidapi.com/location/country/list")
        .then((res) {
      if (res.data["status"] == "success") {
        print(res.data["countries"]);
        getCountryList(json: res.data["countries"]);
        box.write("countryList", countryList);
      } else {
        getDialog(title: "Failed", desc: "Something went wrong....");
      }
    }).catchError((error) {
      getDialog(title: "Failed", desc: "Something went wrong....");
    });
  }

  getCity() async {
    Dio dio = Dio();
    dio.options.headers['X-RapidAPI-Key'] =
        '8bc41a76dcmsh771a23e5e6a7a21p101d01jsn5d4b64f99662';
    // dio.options.headers["X-RapidAPI-Host"] = "countries-cities.p.rapidapi.com";
    await dio
        .get(
            "https://countries-cities.p.rapidapi.com/location/country/IN/city/list?page=1&per_page=200&population=1000000")
        .then((res) {
      if (res.data["status"] == "success") {
        hasData.value = true;
        CityModel cityModel = CityModel.fromJson(res.data);
        if (!isNullEmptyOrFalse(cityModel.cities)) {
          cityModel.cities!.forEach((element) {
            city.add(element.name.toString());
          });
          box.write("cityList", city);
        }
      } else {
        hasData.value = true;

        getDialog(title: "Failed", desc: "Something went wrong....");
      }
    }).catchError((error) {
      hasData.value = true;

      getDialog(title: "Failed", desc: "Something went wrong....");
    });
  }

  getCountryList({required Map<String, dynamic> json}) {
    json.forEach((key, value) {
      countryList.add(value);
    });
  }
}
