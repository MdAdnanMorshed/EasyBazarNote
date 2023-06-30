class ItemModel {
  int? itemId;
  String? itemName;
  String? itemCategoryName;
  String? itemSubCategoryName;
  dynamic itemPrice;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
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