import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/utils/app_space.dart';
import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Category'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [

              AppSpace.spaceH10,
              Container(
                margin:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                padding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Form(
                  key: controller.formKey,
                  child:Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: TextFormField(
                          controller: controller.categoryNameController,
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
                            labelText: 'User Mail Address',
                          ),
                          validator: (val) {
                            if (val == '') return 'Enter valid email';
                          },
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            print(
                                'AuthenticationView.build ${controller.isRegister.value}');
                            if (controller.formKey.currentState!.validate()) {
                              /*   if (controller.isRegister.value) {
                        controller
                            .signUpByFirebaseAPI(); //controller.signUp()
                    } else {
                        controller
                            .signInByFirebaseAPI(); //controller.signIn();
                    }*/
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding:
                              EdgeInsets.symmetric(horizontal: 100, vertical: 5),
                              textStyle: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              )),
                          child:
                          const Text(
                            'Create Category',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
