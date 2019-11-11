import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/http/dio_agent.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotPage extends StatefulWidget
{
  List<Map> datas=[];//注意这里要这样写，不要写成List<Map> datas,因为数据加载时异步的，如果数据没有回来的话datas就是null
  HotPage({Key key,this.datas}):super(key:key);
  @override
  State<StatefulWidget> createState() {
    return HotPageState();
  }

}

class HotPageState extends State<HotPage>
{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          _getTitleWidget(),
          _getContent(),
        ],
      ),
    );
  }

  Widget _getTitleWidget()
  {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text("火爆专区",style: TextStyle(color: Colors.lightBlue),),
    );
  }

  Widget _getContent()
  {
    return Wrap(
      spacing: 2,
      children: widget.datas.map((element){
        return _getItem(element);
      }).toList(),
    );
  }

  Widget _getItem(Map data)
  {
    return Container(
      width: ScreenUtil.instance.setWidth(372),
      child: Column(
        children: <Widget>[
          Image.network(data['image']),
          Container(
            margin: EdgeInsets.only(top: 6),
            child:Text(data['name']) ,
          )
          ,
          Container(
            padding: EdgeInsets.fromLTRB(10, 6, 10, 6),
            child: Row(
              children: <Widget>[
                Text("￥${data['price']}"),
                Expanded(
                    child: Text("￥${data['mallPrice']}",
                      style: TextStyle(color: Colors.black12,decoration: TextDecoration.lineThrough),
                      textAlign: TextAlign.end,

                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

}