import 'package:flutter/material.dart';
import 'package:flutter_app/model/CategoryModel.dart';
import 'package:flutter_app/provide/category_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CatetoryTab extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
//    CategoryModelNotifier dataInfo = Provider.of<CategoryModelNotifier>(context);
    return Consumer<CategoryModelNotifier>(
        builder: (context,categoryModelNotifier,widget){
          return Container(
            height: ScreenUtil.instance.setHeight(70),
            width: ScreenUtil.instance.setWidth(550),
            decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: Colors.black12))),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: categoryModelNotifier.value.bxMallSubDto.map((element){
                return Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(6),
                  child: Text(element.mallSubName,style: TextStyle(
                    fontSize: ScreenUtil.instance.setSp(28)
                  ),),
                );
              }).toList(),
            ),
          );
        },
    );

//  return Container(
//    child: Text("成都:${dataInfo.value.bxMallSubDto.length}"),
//  );
  }

}