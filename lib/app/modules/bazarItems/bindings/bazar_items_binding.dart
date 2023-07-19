import 'package:get/get.dart';

import '../controllers/bazar_items_controller.dart';

class BazarItemsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BazarItemsController>(
      () => BazarItemsController(),
    );
  }
}
