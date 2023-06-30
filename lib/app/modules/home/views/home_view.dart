

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newspaper_app/app/data/models/is_item_model.dart';

import 'package:newspaper_app/app/data/utils/app_space.dart';
import 'package:newspaper_app/app/data/utils/shimmer_effect.dart';
import 'package:newspaper_app/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        appBar: AppBar(
          title: const Text('Easy Bazar note App'),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                print('HomeView.build Logout');
                Get.offNamedUntil(Routes.AUTHENTICATION, (route) => false);
              },
              child: const Icon(Icons.logout),
            ),
            AppSpace.spaceW12,
            InkWell(
              onTap: () {
                Get.toNamed(Routes.BAZAR_ITEM);
              },
              child: const Icon(
                Icons.add,
                color: Colors.green,
                size: 25,
              ),
            ),
            AppSpace.spaceW12,
          ],
        ),
        body: Obx(() {
          if (!controller.isLoadingData.value) {
            return Center(
              child: ShimmerLoading.vListViewLoading(),
            );
          } else {
            if (controller.item.isEmpty) {
              return const Center(child: Text('No Data Found!'));
            } else {
              return ListView.builder(
                itemCount: controller.item.length,
                itemBuilder: (BuildContext context, int index) {
                  ItemModel data = controller.item[index];
                  print('data>>>111?? ${data.toJson()}');
                  print('data>>>Name?? ${data.itemName.toString()}');
                  return _bazarCardWidget(context,data, index);
                },
              );
            }
          }
        }),


      bottomNavigationBar: Container(
        height: 50,
        alignment: Alignment.center,
        child:  Text('View All ',style: TextStyle(
            fontSize: 20,
            color: Colors.white),),

        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        width: double.infinity,
        color: Colors.green,),

    );
  }

  _bazarCardWidget(BuildContext context, ItemModel data, int index) {

    return InkWell(
      onTap: () {
        Get.toNamed(Routes.NEWS_DETAILS, arguments: data);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
        margin: const EdgeInsets.only(left: 10, right: 10, top: 8),
        height: Get.size.width / 4.2,
        width: Get.size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white.withOpacity(0.9),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
                height: Get.size.height / 6.5,
                width: Get.size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.7),
                ),
                child: Hero(
                  tag: data.itemName.toString(),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/no_image.png',
                        fit: BoxFit.fill,
                        filterQuality: FilterQuality.high,
                      )
                      /* Image.network(
                     '',
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Image.asset(
                          'assets/no_image.png',
                          fit: BoxFit.fill,
                          filterQuality: FilterQuality.high,
                        );
                      },
                    ),*/
                      ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSpace.spaceH4,
                    Text(
                      data.updatePerson.toString() ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                      style: const TextStyle(fontWeight: FontWeight.w400),
                    ),
                    AppSpace.spaceH4,
                    Text(
                      data.itemPrice.toString() ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                      style: const TextStyle(fontWeight: FontWeight.w400),
                    ),
                    Row(
                      children: [
                        const Text(
                          'published At : ',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          data.updatedAT.toString().substring(0, 10),
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => Expanded(
                child: CheckboxListTile(
                  title: const Text(''),
                  value: controller.isItem.value,
                  onChanged: (bool? value) {
                    _displayDialog(context,data);

                    controller.isItem.value=value!;

                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


    _displayDialog(BuildContext context, ItemModel data) async {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title:  Text('Item  : ${data.itemName}'),

              content: TextField(
                controller: controller.qtyController,
                decoration: const InputDecoration(hintText: "Qty"),
              ),
              actions: <Widget>[
                 ElevatedButton(
                  child: const  Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }

}
