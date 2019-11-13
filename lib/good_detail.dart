import 'package:flutter/material.dart';

class GoodDetailWidget extends StatelessWidget
{
  String goodId;
  GoodDetailWidget({Key key,this.goodId}):super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text("商品id:${goodId}");
  }

}