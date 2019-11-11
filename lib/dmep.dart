import 'package:flutter/material.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        height: 300.0,
        width: 300.0,
        color: Colors.red,
        child: Custem()
      ),
    );
  }
}
class Custem extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    print('');
    return Container(
      height: 100.0,
      width: 100.0,
      color: Colors.blue,
    );
  }

}

