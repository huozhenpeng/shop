import 'package:flutter/material.dart';
import 'package:flutter_app/shopcar_pages/shopocar_page.dart';

import 'category_pages/category_page.dart';
import 'home_pages/home_page.dart';
import 'member_pages/member_page.dart';

class MainPage  extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {

    return _MainPageState();
  }

}

class _MainPageState extends State<MainPage>
{
  List<BottomNavigationBarItem> items;
  int _currentIndex=0;

  List<Widget> widgets;
  @override
  void initState() {
    items=[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text("首页")
    ),
      BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text("分类")
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          title: Text("购物车")
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle),
          title: Text("会员中心")
      )
    ];

    widgets=[HomePage(),CategoryPage(),ShopcarPage(),MemberPage()];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: items,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index){
            setState(() {
              _currentIndex=index;
            });
        },
      ),
      //body: widgets[_currentIndex],
      body: IndexedStack(
        children: widgets,
        index: _currentIndex,
      ),
    );
  }

}
