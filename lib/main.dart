import 'package:flutter/material.dart';
import 'package:flutter_app/provide/category_data.dart';
import 'package:flutter_app/splansh_page.dart';
import 'package:provider/provider.dart';

void main(){
  final categoryModelNotifier= CategoryModelNotifier();
  runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: categoryModelNotifier)
    ],
    child: MyApp(),
  )
  );
}

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



