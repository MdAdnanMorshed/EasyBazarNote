import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BazarItemController extends GetxController {
  final itemNameController = TextEditingController();
  final userUpdatePersonController = TextEditingController();
  final itemPriceController = TextEditingController();

  final isRegister = true.obs;
  final auth = 'Sign In'.obs;
  final formKey = GlobalKey<FormState>();

  final userName = '';
  final userMail = '';
  final userPass = '';

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;


}
