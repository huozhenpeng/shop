import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FloorWidget extends StatefulWidget
{
  List<Map> datas;
  String url;
  FloorWidget({Key key,this.datas,this.url}):super(key:key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FloorWidgetWidget();
  }

}

class _FloorWidgetWidget extends State<FloorWidget>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          _getImageWidget(widget.url),
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  _getCommonItem(widget.datas[0]),
                  _getCommonItem(widget.datas[1]),
                ],

              ),
              Column(
                children: <Widget>[
                  _getCommonItem(widget.datas[2]),
                  _getCommonItem(widget.datas[3]),
                  _getCommonItem(widget.datas[4]),
                ],
              )
            ],
          )
        ],
      ),
    );

  }


  Widget _getCommonItem(Map data)
  {
    return InkWell(
      child: Container(
         width: ScreenUtil.instance.setWidth(375),
         child:Image.network(data['image'])
      ),
    );
    
  }

  Widget _getImageWidget(String path)
  {
    return InkWell(

      child: Container(
        child: Image.network(path),
      ),
    );
  }

}