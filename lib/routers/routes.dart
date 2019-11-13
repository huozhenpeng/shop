import 'package:fluro/fluro.dart';

import 'handler.dart';

class Routes{
  static Router router;
  static String detailsPage="/detail";//商品详情页面
  static void configureRoutes(Router router)
  {
    router.define(detailsPage, handler: goodInfoHandler);
  }
}