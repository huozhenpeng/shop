import 'package:flutter/material.dart';
import 'package:flutter_app/splansh_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: '百姓生活购物',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplanshWidget(),
    );
  }
}



