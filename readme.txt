###第一次书写

     效果：底部导航栏、轮播效果、网络请求、屏幕适配

     三方知识：dio、flutter_screenutil、flutter_swiper

     系统知识：FutureBuilder

###第二次编写

     注意：每个小模块抽取类，每个类中比较复杂的widget抽取方法(不要再抽取类,类太多了也不好)

     三方知识：拨打电话的插件url_launcher，完了试着自己定义个插件（最起码先能供Android使用）

     系统知识：注意状态的保存，貌似跟以前不太一样


     问题：1、SingleChildScrollView加入的位置

          2、注意使用GridView的坑childAspectRatio

             * 首先在构造GridView的时候有好几种方式，如果使用GridView.builder()方法来做的话，需要传入一个参数：gridDelegate

               然后我使用的是SliverGridDelegateWithFixedCrossAxisCount，这个表示每行有固定的元素个数，测试中我每行占4个元素，

               数据大小总共有11个，不满12个，结果直接报错，针对这种情况可以使用另一种构造方式GridView.count()


             * 使用GridView.count()构造GridView时的坑，它里面有个参数：childAspectRatio，这个代表的是每个子元素长度与宽度的比例，因为

               只要我们确定了每行有多少个元素，那么每个子元素的宽度就确定了，根据childAspectRatio就可以确定每个子元素的高度了，这个值

               如果没有传的话，默认是1，小心高度显示不全


     待解决： * 触点在GridView上的时候无法上下滑动的问题

               看后面的视频的时候，发现有属性可以禁用GridView的滑动，应该是可以解决这个问题的

             * 关于适配的问题，使用ScreenUtil适配时，注意ScreenUtil.instance.setWidth(100)和ScreenUtil.instance.setHeight(100)表现出的高度是不一样的



###目前环境无法下载flutter插件，这是直接调用原生的插件，比如说url_launcher插件

###第三次编写

     知识点：下拉刷新、上拉加载、状态管理(主要是跨类)

     三方知识：flutter_easyrefresh、json转Model(https://javiercbk.github.io/json_to_dart/)

     系统知识：Provide实现状态管理

     问题：    * List<Map> datas=[];//注意这里要这样写，不要写成List<Map> datas,因为数据加载时异步的，如果数据没有回来的话datas就是null


              * 目前首页下拉刷新是写在最外层的，因为首页整个控件都是可以滑动的，本来底部的"火爆专区"是由专门的类负责的，包括ui和数据，但是现在

                只能把数据的获取放到最外层了，这就是目前state更新的缺陷

              * 注意这儿保存页面状态的方式与前面有什么不同



###第四次编写

     问题：    * 分类页面，中间的ListView的宽高问题，可不可以不设置宽高，或者说只设置一个；Expanded的使用


              * 点击侧边栏去请求接口改变中间ListView内容的时候，我觉得最好把请求接口的地方放入中间ListView的Provider中，待会试一下是否可行

                试过后发现是可行的，而且简单很多


              * 注意中间的ListView没有数据的问题（提示暂无数据）



###第五次编写

     效果：分类页面listView的下拉刷新、以及切换tab后ListView自动定位到顶部

     问题：如果在白酒页面加载到第四五页，切换啤酒，啤酒会自动加载两三页内容，这个bug可能跟使用的上拉加载控件有关，视频中每次切换回到顶部的方法也有bug，

          目前还没有解决？
###第六次编写



     知识点：企业级路由：fluro         加载html的widget：flutter_html（系统没有提供类似WebView的控件）

     问题：    * Provider的原理还不是很理解

              * 异步嵌套异步是工作在不同子线程吗？

                 这个其实是协程，flutter中的线程是isolate ，有独立内存，类似于java中的进程

              * 关于FutureBuilder这个widget

              * 在商品详情页面，使用Stack标签做购物车感觉不合理，会遮挡下面一部分，感觉应该使用Column配合Expanded使用




