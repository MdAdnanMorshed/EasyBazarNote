import 'package:get/get.dart';

import '../controllers/bazar_item_controller.dart';

class BazarItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BazarItemController>(
      () => BazarItemController(),
    );
  }
}
