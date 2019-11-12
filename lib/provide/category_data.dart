import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/http/dio_agent.dart';
import 'package:flutter_app/model/CategoryContent.dart';
import 'package:flutter_app/model/CategoryModel.dart';
import 'package:flutter_app/model/CategoryModel.dart' as prefix0;

class CategoryModelNotifier with ChangeNotifier
{

  CategoryItem _categoryItem=CategoryItem()..bxMallSubDto=[];

  void setData(CategoryItem _categoryItem)
  {

    print("设置数据");
    //先将上次设置的全部删除调
    if(this._categoryItem!=null&&this._categoryItem.bxMallSubDto.length>0)
      {
        this._categoryItem.bxMallSubDto.removeAt(0);
      }
    BxMallSubDto firstBx=_categoryItem.bxMallSubDto[0];
    BxMallSubDto bxMallSubDto=BxMallSubDto();
    bxMallSubDto.mallCategoryId=firstBx.mallCategoryId;
    bxMallSubDto.mallSubId="";
    bxMallSubDto.mallSubName="全部";
    _categoryItem.bxMallSubDto.insert(0,bxMallSubDto);
    this._categoryItem=_categoryItem;
    //记得将上面的tab index清0
    _currentIndex=0;

    notifyListeners();

    //获取中间内容区域数据
    requestContent(_categoryItem.mallCategoryId, "", 1);

  }


  int _currentIndex=0;
  int get currentIndex=>_currentIndex;
  void setCurrentIndex(int index)
  {
    _currentIndex=index;
  }

  void requestContent(String categoryId,String categorySubId,int page)
  {

    getCategoryContent(categoryId,categorySubId,page).then((result){

     CategoryContent categoryContent= CategoryContent.fromJson(json.decode(result));
     _categoryContent=categoryContent;
     notifyListeners();
    });

  }

  CategoryContent _categoryContent;

  CategoryContent get content=>_categoryContent;
  CategoryItem get value=>_categoryItem;

}