import 'package:gadingcare/app/modules/info_pluitcare/controllers/info_pluitcare_controller.dart';
import 'package:get/get.dart';

class InfogadingcareBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InfogadingcareController>(
      () => InfogadingcareController(),
    );
  }
}
