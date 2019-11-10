import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/http/dio_agent.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
class HomePage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("百姓生活+"),
      ),
      body: FutureBuilder(
        future: getHomeContent(),
          builder: (context,snapshot)
              {
                if(snapshot.hasData)
                  {
                    var data=json.decode(snapshot.data.toString());
                    List<Map> swiperDataList=(data['data']['slides'] as List).cast();
                    String info="商品推荐";
                    List<Map> products=(data['data']['recommend'] as List).cast();

                    List<Map> recomands=(data['data']['category'] as List).cast();

                    String url=data['data']['advertesPicture']['PICTURE_ADDRESS'];

                    return SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SwiperWidget(items: swiperDataList),
                          ProductCategroysWidget(info: info,datas:products),
                          AdBanner(url: url),
                          CategoryWidget(datas: recomands),

                        ],
                      ),
                    );
                  }
                else
                  {
                    return Container(
                      alignment: Alignment.topCenter,
                      //loading效果
                      child: Text("加载中。。。"),
                    );
                  }
              }
      ),
    );
  }
}
//banner
class SwiperWidget extends StatelessWidget
{
  SwiperWidget({Key key,this.items}):super(key:key);
  List<Map> items;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.instance.setWidth(750),
      height: ScreenUtil.instance.setHeight(300),
      child: Swiper(
        itemCount: items.length,
        autoplay: true,
        //指示条
        pagination: SwiperPagination(),
        itemBuilder: (context,index){
          return Image.network("${items[index]['image']}",fit: BoxFit.fill);
        },
      ),
    );
  }
}

///listview
class ProductCategroysWidget extends StatelessWidget
{
  String info;
  List<Map> datas;
  ProductCategroysWidget({Key key,this.info,this.datas}):super(key:key);
  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        _getRecommand(info),
        _getListItems(datas)

      ],
    );
  }
  ///推荐
  Widget _getRecommand(String info)
  {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(12),
      alignment: Alignment.centerLeft,
      child: Text(info,style: TextStyle(color: Colors.lightBlueAccent)),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: Colors.black12))),
    );
  }

  ///商品列表
  Widget _getListItems(List<Map> datas)
  {
    return Container(
      child: ListView.builder(itemBuilder: (context,index){
        return _getItem(datas[index]);
      },
        scrollDirection: Axis.horizontal,
        itemCount: datas.length,
      ),
      //这儿如果没有定义高度，会报错：18:57:07.164 4 info flutter.tools I/flutter ( 8817): Horizontal viewport was given unbounded height.
      height: ScreenUtil.instance.setHeight(320),
      width: ScreenUtil.instance.setWidth(750),
    );
  }

  ///商品种类item
  Widget _getItem(Map data)
  {
    return InkWell(

      onTap: (){

      },

      child: Container(
        color: Colors.white,
        width: ScreenUtil.instance.setWidth(250),
        height: ScreenUtil.instance.setHeight(300),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(border: Border(left: BorderSide(width: 1.0,color: Colors.black12))),
              child: Image.network(data['image']),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 20),
              child: Text(
                "${data['mallPrice']}",
                style: TextStyle(
                  color: Colors.black
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "${data['price']}",
                style: TextStyle(
                    color: Colors.black26,
                   decoration: TextDecoration.lineThrough
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
///gridview
class CategoryWidget extends StatelessWidget
{
  CategoryWidget({Key key,this.datas}):super(key:key);
  List<Map> datas;
  @override
  Widget build(BuildContext context) {
    if(datas.length>10)
      {
       datas.removeLast();
      }
    return Container(
        margin: EdgeInsets.only(top: 10),
        //color: Colors.red,
        width: ScreenUtil.instance.setWidth(750),
        height: ScreenUtil.instance.setHeight(350),
        //padding: EdgeInsets.all(6.0),
//这个会报错，就是返回了11条数据，没行占5个
//        child: GridView.builder(
//            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
//            itemBuilder: (context,index){
//              return _getItemWidget(datas[index]);
//        }),
      child: GridView.count(
        //注意这个值很重要
        childAspectRatio: 0.7,
        crossAxisSpacing: 6.0,
        mainAxisSpacing: 10.0,
        crossAxisCount: 5,
        children:datas.map((element){
         return _getItemWidget(element);
         }
      ).toList(),
      ),
      )
    ;
  }
  
  Widget  _getItemWidget(Map map)
  {
    return InkWell(
      child:Container(
        color: Colors.black12,
        child:Column(
          children: <Widget>[
            _getImages(map['image']),
            Text(map['mallCategoryName'])
          ],
        ) ,
      ),
      onTap: (){

      },
    );
  }
  
  Widget _getImages(String url)
  {

    ///ClipOval没有起到作用，先放下
    return ClipOval(
        child:Container(
          //color: Colors.black12,
          alignment: Alignment.center,
          //padding: EdgeInsets.all(6.0),
          width: ScreenUtil.instance.setWidth(120),
          height: ScreenUtil.instance.setHeight(120),
          child: Image.network(
            url,
            fit: BoxFit.fitWidth,
          ),
        )
    );


  }
  
  
}

class AdBanner extends StatelessWidget
{
  String url;
  AdBanner({Key key,this.url}):super(key:key);
  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Image.network(url),
    );
  }
  
}

class PhoneWidget extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

    return InkWell(

    );
  }

}
