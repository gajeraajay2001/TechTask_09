import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_exam_09/app/constant/sizeConstant.dart';
import 'package:tech_exam_09/model/info_model.dart';

class HomeScreenController extends GetxController {
  RxList<InfoData> data = RxList<InfoData>([]);
  RxBool hasData = false.obs;
  GetStorage box = GetStorage();
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  getData() {
    if (box.read("data") != null) {
      List response = box.read("data");

      response.forEach((element) {
        data.add(InfoData.fromJson(element));
      });
      hasData.value = true;
    } else {
      hasData.value = true;
    }
  }

  deleteData({required String id}) {
    List listOfMap = [];
    data.removeWhere((element) => element.id == id);
    data.refresh();
    data.forEach((element) {
      listOfMap.add(element.toJson());
    });
    box.write("data", listOfMap);
  }
}
