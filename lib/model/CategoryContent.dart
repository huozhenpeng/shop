class CategoryContent {
  String code;
  String message;
  List<ContentItem> data;

  CategoryContent({this.code, this.message, this.data});

  CategoryContent.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<ContentItem>();
      json['data'].forEach((v) {
        data.add(new ContentItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ContentItem {
  String image;
  double oriPrice;
  double presentPrice;
  String goodsName;
  String goodsId;

  ContentItem(
      {this.image,
        this.oriPrice,
        this.presentPrice,
        this.goodsName,
        this.goodsId});

  ContentItem.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    oriPrice = json['oriPrice'];
    presentPrice = json['presentPrice'];
    goodsName = json['goodsName'];
    goodsId = json['goodsId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['oriPrice'] = this.oriPrice;
    data['presentPrice'] = this.presentPrice;
    data['goodsName'] = this.goodsName;
    data['goodsId'] = this.goodsId;
    return data;
  }
}