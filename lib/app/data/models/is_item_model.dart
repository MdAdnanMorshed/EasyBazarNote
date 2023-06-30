
class IsItemModel {
  bool? isItem;
  List<ItemModel>? itemModel;

  IsItemModel({this.isItem, this.itemModel});

  IsItemModel.fromJson(Map<String, dynamic> json) {
    isItem =false;
    //json['isItem'];
    if (json['itemModel'] != null) {
      itemModel = <ItemModel>[];
      json['itemModel'].forEach((v) {
        itemModel!.add( ItemModel.fromJson(v));
      });

      print('IsItemModel.fromJson lng : ${itemModel!.length}');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['isItem'] = false;
        //this.isItem;
    if (itemModel != null) {
      data['itemModel'] = itemModel!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ItemModel {
  int? itemId;
  String? itemName;
  String? itemCategoryName;
  String? itemSubCategoryName;
  int? itemPrice;
  String? updatedAT;
  String? updatePerson;

  ItemModel(
      {this.itemId,
        this.itemName,
        this.itemCategoryName,
        this.itemSubCategoryName,
        this.itemPrice,
        this.updatedAT,
        this.updatePerson});

  ItemModel.fromJson(Map<String, dynamic> json) {
    itemId = json['itemId'];
    itemName = json['itemName'];
    itemCategoryName = json['itemCategoryName'];
    itemSubCategoryName = json['itemSubCategoryName'];
    itemPrice = json['itemPrice'];
    updatedAT = json['updatedAT'];
    updatePerson = json['updatePerson'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['itemId'] = this.itemId;
    data['itemName'] = this.itemName;
    data['itemCategoryName'] = this.itemCategoryName;
    data['itemSubCategoryName'] = this.itemSubCategoryName;
    data['itemPrice'] = this.itemPrice;
    data['updatedAT'] = this.updatedAT;
    data['updatePerson'] = this.updatePerson;
    return data;
  }
}

