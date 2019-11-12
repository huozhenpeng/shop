import 'package:flutter/material.dart';
import 'package:flutter_app/model/CategoryModel.dart';

class CategoryModelNotifier with ChangeNotifier
{

  CategoryItem _categoryItem=CategoryItem()..bxMallSubDto=[];

  void setData(CategoryItem _categoryItem)
  {
    print("设置数据");
    this._categoryItem=_categoryItem;
    notifyListeners();
  }

  CategoryItem get value=>_categoryItem;

}