import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/database/db_helper.dart';
import '../../../data/utils/app_space.dart';
import '../controllers/bazar_item_controller.dart';

class BazarItemView extends GetView<BazarItemController> {
  const BazarItemView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Bazar Item'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppSpace.spaceH20,
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      Row(

                        children: [
                          Expanded(
                            flex: 5,
                            child: TextFormField(

                              obscureText: true,
                              controller: controller.itemPriceController,
                              style: const TextStyle(color: Colors.green),
                              decoration: const InputDecoration(
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(color: Colors.blue)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5.0),
                                    ),
                                    borderSide: BorderSide(color: Colors.blue)),
                                filled: true,
                                contentPadding: EdgeInsets.only(
                                    bottom: 10.0, left: 10.0, right: 10.0),
                                labelText: 'Drop Down Category',
                              ),
                              validator: (val) {
                                return null;
                              },
                            ),
                          ),

                          Expanded(

                            child:   Container(
                              alignment: Alignment.center,
                              width: 40,
                              height: 40,
                              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                              margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),

                              color: Colors.green,
                              child: const Text(
                                '+',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),)

                        ],
                      ),

                      AppSpace.spaceH20,
                      Row(

                        children: [
                          Expanded(
                            flex: 5,
                            child: TextFormField(

                              obscureText: true,
                              controller: controller.itemPriceController,
                              style: const TextStyle(color: Colors.green),
                              decoration: const InputDecoration(
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(color: Colors.blue)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5.0),
                                    ),
                                    borderSide: BorderSide(color: Colors.blue)),
                                filled: true,
                                contentPadding: EdgeInsets.only(
                                    bottom: 10.0, left: 10.0, right: 10.0),
                                labelText: 'Drop Down Sub Category',
                              ),
                              validator: (val) {
                                return null;
                              },
                            ),
                          ),

                          Expanded(

                            child:   Container(
                              alignment: Alignment.center,
                              width: 40,
                              height: 40,
                              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                              margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),

                              color: Colors.green,
                              child: const Text(
                                '+',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),)

                        ],
                      ),
                      AppSpace.spaceH20,
                      TextFormField(
                        controller: controller.itemNameController,
                        style: const TextStyle(color: Colors.green),
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.blue)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                              borderSide: BorderSide(color: Colors.blue)),
                          filled: true,
                          contentPadding: EdgeInsets.only(
                              bottom: 10.0, left: 10.0, right: 10.0),
                          labelText: 'Item Name',
                        ),
                        validator: (val) {
                          if (val == '') return 'Enter valid Item Name';
                        },
                      ),
                      AppSpace.spaceH10,
                      TextFormField(
                        obscureText: false,
                        controller: controller.itemPriceController,
                        style: const TextStyle(color: Colors.green),
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.blue)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                              borderSide: BorderSide(color: Colors.blue)),
                          filled: true,
                          contentPadding: EdgeInsets.only(
                              bottom: 10.0, left: 10.0, right: 10.0),
                          labelText: 'Item Price',
                        ),
                        validator: (val) {
                          if (val == '') {
                            return 'Enter valid Item Price';
                          }
                        },
                      ),
                      AppSpace.spaceH20,
                      TextFormField(
                        obscureText: false,
                        controller: controller.userUpdatePersonController,
                        style: const TextStyle(color: Colors.green),
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.blue)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                              borderSide: BorderSide(color: Colors.blue)),
                          filled: true,
                          contentPadding: EdgeInsets.only(
                              bottom: 10.0, left: 10.0, right: 10.0),
                          labelText: 'Update Person',
                        ),
                        validator: (val) {
                         return null;
                        },
                      )
                    ],
                  ),
                ),
              ),
             ElevatedButton(
                    onPressed: () async{
                      print('BazarItemView.build Item ');


                      Map<String, dynamic> createAccountDB = {
                        DatabaseHelper.itemName: controller.itemNameController.text,
                        DatabaseHelper.itemCategoryName: 'Grocery',
                        DatabaseHelper.itemSubCategoryName: 'Oil',
                        DatabaseHelper.itemPrice:  controller.itemPriceController.text,
                        DatabaseHelper.updatedAT: DateTime.now().toIso8601String(),
                        DatabaseHelper.updatePerson: controller.userUpdatePersonController.text
                      };

                     await  DatabaseHelper.instance
                          .itemInsert(createAccountDB)
                          .then((value) {
                        print('inserted row id: $value');

                        if (value > 0) {
                          Get.snackbar('Alert', 'Crate bazar item has added!',backgroundColor: Colors.green,colorText: Colors.white);
                        } else {
                          Get.snackbar('Alert', 'wrong!',backgroundColor: Colors.red);
                        }
                      });


                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 5),
                        textStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        )),
                    child: const Text(
                      'Add Item',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
              AppSpace.spaceH20,
            ],
          ),
        ),
      ),
    );
  }
}
