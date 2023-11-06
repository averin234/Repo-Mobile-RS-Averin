import 'package:rsaverin/app/modules/info_pluitcare/controllers/info_pluitcare_controller.dart';
import 'package:get/get.dart';

class InforsaverinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InforsaverinController>(
      () => InforsaverinController(),
    );
  }
}
