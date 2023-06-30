import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:newspaper_app/app/data/models/newspaper_model.dart';
import 'package:newspaper_app/app/data/repositories/news_repo.dart';
import 'package:newspaper_app/app/data/utils/shimmer_effect.dart';

import '../../../data/database/db_helper.dart';
import '../../../data/models/item_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final count = 0.obs;
 // List dummyData = [].obs;

  List<NewsPaperModel> newsDataList = [];
  List<ItemModel> dummyData = [];
  final isLoadingData = false.obs;

  @override
  void onInit() {
    super.onInit();

    getAllDataList();

    //getNewsData();
  }


  getNewsData() async {
    var resValue = await NewsRepo().getAllNewsList();
    newsDataList.clear();
    var bodyMap = json.decode(resValue.body);
    var resCode = resValue.statusCode;

    if (bodyMap['status'] == 'ok') {
      if (resCode == 200 || resCode == 201 || resCode == 202) {
        for (var data in bodyMap['articles']) {
          newsDataList.add(NewsPaperModel.fromJson(data));
        }
        isLoadingData.value = true;
      } else {
        if (kDebugMode) {
          print(' else error ');
        }
      }
    } else {
      if (kDebugMode) {
        print('HomeController.getNewsData Else ');
      }
    }
  }

  getAllDataList() async{
    await DatabaseHelper.instance.itemGetData().then((value) {


      for(var data in value){
         dummyData.add(ItemModel.fromJson(data));
      }

      //dummyData=value;
      isLoadingData.value = true;
      print('HomeController.getAllDataList lng ${dummyData.length}');
      print('HomeController.getAllDataList ${dummyData.toString()}');
    });

  }
}
