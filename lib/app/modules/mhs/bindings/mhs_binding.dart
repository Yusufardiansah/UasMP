import 'package:get/get.dart';

import '../controllers/mhs_controller.dart';

class MhsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MhsController>(
      () => MhsController(),
    );
  }
}
