import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'main_page.dart';

class SplanshWidget extends StatefulWidget
{

  @override
  State<StatefulWidget> createState() {

    return _SplanshWidgetState();
  }

}

class _SplanshWidgetState extends State<SplanshWidget> with SingleTickerProviderStateMixin
{

  AnimationController _animationController;
  Animation _animation;
  @override
  void initState() {
    _animationController=AnimationController(vsync: this,duration: Duration(milliseconds: 3000));
    _animation=Tween(begin: 0.5,end: 1.0).animate(_animationController);
    _animationController.addStatusListener((state){
      if(state==AnimationStatus.completed)
        {
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context){
            return MainPage();
          }), (route){
            return route==null;
          });
        }
    });
    _animationController.forward();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    //这个初始化最早能提取到这儿
    ScreenUtil.instance=ScreenUtil(width: 750,height: 1334)
      ..init(context);
    return FadeTransition(
        opacity: _animation,
        child: Image.network("https://img0.sc115.com/uploads3/sc/psd/181222/1812220677256.jpg",fit: BoxFit.fill,),
    );
  }

}
