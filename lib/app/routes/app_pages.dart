import 'package:get/get.dart';

import 'package:tech_exam_09/app/modules/home/bindings/home_binding.dart';
import 'package:tech_exam_09/app/modules/home/views/home_view.dart';
import 'package:tech_exam_09/app/modules/home_screen/bindings/home_screen_binding.dart';
import 'package:tech_exam_09/app/modules/home_screen/views/home_screen_view.dart';
import 'package:tech_exam_09/app/modules/personal_info/bindings/personal_info_binding.dart';
import 'package:tech_exam_09/app/modules/personal_info/views/personal_info_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME_SCREEN,
      page: () => HomeScreenView(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.PERSONAL_INFO,
      page: () => PersonalInfoView(),
      binding: PersonalInfoBinding(),
    ),
  ];
}
