import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/utils/dbhelper.dart';

class CategoryController extends GetxController {
  final categoryNameController = TextEditingController();

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

  // working not need now
  createCategory() async {
    print('CategoryController.createCategory');
    final categoryName = categoryNameController.text;

  }



  signInByFirebaseAPI() async {
    try {
      final ProgressDialog progressDialog =
      DBHelper.loadingDialog(Get.overlayContext!);
      progressDialog.show();
      SharedPreferences localStore = await SharedPreferences.getInstance();

      progressDialog.hide();
    } catch (e) {}
  }

}
