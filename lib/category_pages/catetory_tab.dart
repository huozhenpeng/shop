import 'package:flutter/material.dart';
import 'package:flutter_app/model/CategoryModel.dart';
import 'package:flutter_app/provide/category_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CatetoryTab extends StatefulWidget
{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CatetoryTabState();
  }

}

class CatetoryTabState extends State<CatetoryTab>
{

  //这个值必须由provider控制，在点击左边栏tab的时候要将它清0
  //int currentIndex=0;
  @override
  Widget build(BuildContext context) {
//    CategoryModelNotifier dataInfo = Provider.of<CategoryModelNotifier>(context);
    return Consumer<CategoryModelNotifier>(
      builder: (context,categoryModelNotifier,widget){
        return Container(
          height: ScreenUtil.instance.setHeight(70),
          width: ScreenUtil.instance.setWidth(550),
          decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: Colors.black12))),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryModelNotifier.value.bxMallSubDto.length,
            itemBuilder: (context,index){
              int currentIndex=categoryModelNotifier.currentIndex;
              bool isSelected=currentIndex==index?true:false;
              BxMallSubDto element=categoryModelNotifier.value.bxMallSubDto[index];
              return Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(6),
                child: InkWell(
                  onTap: (){
                    Provider.of<CategoryModelNotifier>(context).setCurrentIndex(index);
//                    setState(() {
//
//                    });
                    Provider.of<CategoryModelNotifier>(context).requestContent(element.mallCategoryId,element.mallSubId,1);
                  },
                  child: Text(element.mallSubName,style: TextStyle(
                      fontSize: ScreenUtil.instance.setSp(28),
                    color: isSelected?Colors.lightBlue:Colors.black
                  ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );

//  return Container(
//    child: Text("成都:${dataInfo.value.bxMallSubDto.length}"),
//  );
  }

}