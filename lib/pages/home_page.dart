import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
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
            )
          ],
        ),
      ),
    );
  }

}