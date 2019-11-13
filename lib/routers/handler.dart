import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/good_detail.dart';

var goodInfoHandler=Handler(handlerFunc: (BuildContext context, Map<String, List<String>> parameters){

  return GoodDetailWidget(goodId: parameters["id"][0],);

});
