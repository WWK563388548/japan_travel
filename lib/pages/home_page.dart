import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const APPBAR_SCROLL_OFFSET = 100; // 滚动最大距离

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // TODO: will use local images
  List _imageUrls = [
    "https://i02piccdn.sogoucdn.com/549b9ec4ce259c14",
    "https://desk-fd.zol-img.com.cn/t_s960x600c5/g2/M00/08/04/Cg-4WlUsfneIaXjtAAw3U90BfkIAABhDwJlBbUADDdr624.jpg",
    "https://img4.cache.netease.com/photo/0006/2015-09-16/B3KICP0I5LIF0006.jpg",
  ];
  double _appBarAlpha = 0.0;

  _onScroll(offset) {
    // 当滚动距离大于APPBAR_SCROLL_OFFSET时，appbar完全变为白色
    double alpha  = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) alpha = 0;
    else if (alpha > 1) alpha = 1;

    setState(() {
      _appBarAlpha = alpha;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 适配屏幕（刘海屏）
      body: Stack( // Stack的children中，前面的组件叠在下面，后面的组件叠在上面
        children: <Widget>[
          MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: NotificationListener( // 监听ListView的滚动
                // ignore: missing_return
                onNotification: (scrollNotification){ // 监听ListView的滚动函数
                  if (scrollNotification is ScrollUpdateNotification && scrollNotification.depth == 0) {
                    // 滚动，且是列表滚动的时候 && 过滤掉ListView内部的组件的滚动
                    _onScroll(scrollNotification.metrics.pixels);
                  }
                },
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: 160,
                      child: Swiper(
                        itemCount: _imageUrls.length,
                        autoplay: true,
                        itemBuilder: (BuildContext context, int index){
                          return Image.network(
                            _imageUrls[index],
                            fit: BoxFit.fill,
                          );
                        },
                        pagination: SwiperPagination(),
                      ),
                    ),
                    // TODO: just a sample for appbar scroll, will remove it later
                    Container(
                      height: 800,
                      child: ListTile(title: Text("Test"),),
                    )
                  ],
                ),
              )
          ),
          /// 自定义的Appbar，叠在整个主页上面，会随着滚动进行渐变（改变透明度）
          Opacity(
              opacity: _appBarAlpha,
              child: Container(
                height: 80,
                decoration: BoxDecoration(color: Colors.white),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text("首页"),
                  ),
                ),
              ),
          )
        ],
      )
    );
  }

}