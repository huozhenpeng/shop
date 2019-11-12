import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/http/dio_agent.dart';
import 'package:flutter_app/model/CategoryModel.dart';
import 'package:flutter_app/provide/category_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'catetory_tab.dart';
class CategoryPage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CategoryPageState();
  }

}

class CategoryPageState extends State<CategoryPage> with AutomaticKeepAliveClientMixin
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("商品分类"),),
      body: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            LeftWidget(),
            CatetoryTab()
          ],
        ),
      )
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}

class LeftWidget extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LeftWidgetState();
  }

}

class LeftWidgetState extends State<LeftWidget>
{
  List<CategoryItem> datas=[];
  int listIndex=0;
  @override
  void initState() {
    print("initState开始执行");
    getCategory().then((value){
      print("分类列表拿到数据");
      //转json
      CategoryModel categoryModel=CategoryModel.fromJson(json.decode(value));
      datas.addAll(categoryModel.data);
      //这个是更新行列表
      Provider.of<CategoryModelNotifier>(context).setData(datas[0]);
      //这个是更新列listview
      setState(() {

      });
    });
    print("initState执行完毕");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      //必须设置宽度，否则报错
      width: ScreenUtil.instance.setWidth(200),
//      child:ListView(
//          scrollDirection: Axis.vertical,
//          children: datas.map((element){
//            return getItemWidget(element);
//          }).toList(),

//    )
    child: ListView.builder(
      itemCount: datas.length,
        itemBuilder: (context ,index){
     return getItemWidget(index);
    }),
    );
  }

  Widget getItemWidget(int index)
  {
    bool isClick=false;
    isClick=(index==listIndex)?true:false;
    CategoryItem bxMallSubDto=datas[index];
    return InkWell(
      onTap: (){
        setState(() {
          listIndex=index;
        });

        Provider.of<CategoryModelNotifier>(context).setData(bxMallSubDto);
      },
      child: Container(
        height: ScreenUtil.instance.setHeight(100),
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(6, 4, 6, 4),
        decoration: BoxDecoration(
            color: isClick?Colors.black12:Colors.white,
          border:Border(bottom: BorderSide(color: Colors.black12,width: 1),right:BorderSide(color: Colors.black12,width: 1) )
        ),
        child: Text(bxMallSubDto.mallCategoryName,
          style: TextStyle(
            color: Colors.black
          ),
        ),
      ),
    );

  }

}