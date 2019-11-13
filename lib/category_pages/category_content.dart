import 'package:flutter/material.dart';
import 'package:flutter_app/http/dio_agent.dart';
import 'package:flutter_app/model/CategoryContent.dart';
import 'package:flutter_app/provide/category_data.dart';
import 'package:flutter_app/routers/routes.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CategoryContentWidget extends StatefulWidget
{
  //想着放这儿可以呢，结果还是不行，切换左边侧边栏都会累计
  //int page=1;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CategoryContentWidgetState();
  }

}

class CategoryContentWidgetState extends State<CategoryContentWidget>
{
  ScrollController scrollController=ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<CategoryModelNotifier>(
        builder: (context,notifier,child){
//
//          try{
//            if(notifier.page==1)
//            {
//              scrollController.jumpTo(0.0);
//            }
//          }
//          catch(e)
//          {
//            print("发生异常${e.toString()}");
//          }

          CategoryContent categoryContent=notifier.content;
          if(categoryContent!=null&&categoryContent.data!=null&&categoryContent.data.length>0)
            {
              return Container(
                width: ScreenUtil.instance.setWidth(550),
                child:EasyRefresh(
                    child: ListView.builder(
                      itemCount: categoryContent.data.length,
                      itemBuilder: (context,index){
                        return _getItemWidget(categoryContent.data[index]);
                      },
                      controller: ScrollController(
                        initialScrollOffset: 0,
                        keepScrollOffset: false
                      ),
                    ),
                  onLoad: () async{
                      notifier.setPage(notifier.page+1);
                      notifier.requestContent(notifier.value.bxMallSubDto[0].mallCategoryId,notifier.value.bxMallSubDto[0].mallSubId,notifier.page);
                  },
                ),
              );
            }
          else
            {
              return Container(
                margin: EdgeInsets.only(top: 10),
                child: Text("暂无商品"),
              );
            }

      });
  }
  
  Widget _getItemWidget(ContentItem contentItem)
  {
    return InkWell(
      onTap: (){
        Routes.router.navigateTo(context, "${Routes.detailsPage}?id=${contentItem.goodsId}");
      },
      child: Row(
        children: <Widget>[
          _getImage(contentItem),
          Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                _getName(contentItem),
                _getPrice(contentItem)
              ],
            ),
          )

        ],
      ),
    );
  }

  Widget _getImage(ContentItem contentItem)
  {
    return Container(
      padding: EdgeInsets.all(6),
      //这个图片很大，限制下宽度
      width: ScreenUtil.instance.setWidth(250),
      height: ScreenUtil.instance.setWidth(250),
      child: Image.network(contentItem.image),
    );
  }

  Widget _getName(ContentItem contentItem)
  {

    return Container(
      margin: EdgeInsets.only(left: 10),
      width: ScreenUtil.instance.setWidth(280),
      child: Text(
        contentItem.goodsName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.lightBlue,
        ),
      ),
    );
  }

  Widget _getPrice(ContentItem contentItem)
  {
    return Container(

      child: Row(
        children: <Widget>[
          Text("￥${contentItem.presentPrice}",style: TextStyle(),),
          Text("￥${contentItem.oriPrice}",style: TextStyle(decoration: TextDecoration.lineThrough,color: Colors.black12),)
        ],
      ),
    );
  }
  

}