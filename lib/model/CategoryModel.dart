class CategoryModel {
  String code;
  List<CategoryItem> data;
  String message;

  CategoryModel({this.code, this.data, this.message});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = new List<CategoryItem>();
      json['data'].forEach((v) {
        data.add(new CategoryItem.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class CategoryItem {
  List<BxMallSubDto> bxMallSubDto;
  Null comments;
  String image;
  String mallCategoryId;
  String mallCategoryName;
  bool isShow;

  CategoryItem(
      {this.bxMallSubDto,
        this.comments,
        this.image,
        this.mallCategoryId,
        this.mallCategoryName});

  CategoryItem.fromJson(Map<String, dynamic> json) {
    if (json['bxMallSubDto'] != null) {
      bxMallSubDto = new List<BxMallSubDto>();
      json['bxMallSubDto'].forEach((v) {
        bxMallSubDto.add(new BxMallSubDto.fromJson(v));
      });
    }
    comments = json['comments'];
    image = json['image'];
    mallCategoryId = json['mallCategoryId'];
    mallCategoryName = json['mallCategoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bxMallSubDto != null) {
      data['bxMallSubDto'] = this.bxMallSubDto.map((v) => v.toJson()).toList();
    }
    data['comments'] = this.comments;
    data['image'] = this.image;
    data['mallCategoryId'] = this.mallCategoryId;
    data['mallCategoryName'] = this.mallCategoryName;
    return data;
  }
}

class BxMallSubDto {
  String comments;
  String mallCategoryId;
  String mallSubId;
  String mallSubName;

  BxMallSubDto(
      {this.comments, this.mallCategoryId, this.mallSubId, this.mallSubName});

  BxMallSubDto.fromJson(Map<String, dynamic> json) {
    comments = json['comments'];
    mallCategoryId = json['mallCategoryId'];
    mallSubId = json['mallSubId'];
    mallSubName = json['mallSubName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comments'] = this.comments;
    data['mallCategoryId'] = this.mallCategoryId;
    data['mallSubId'] = this.mallSubId;
    data['mallSubName'] = this.mallSubName;
    return data;
  }
}