import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.only(left: 16),
          child: CircleAvatar(),
        ),
        title: Text(
          'Merrily',
          style: TextStyle(
              color: Color(0xff643ff9),
              fontFamily: 'iannnnn-DOG',
              fontSize: 24),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            )),
        child: Incon(),
      ),
    );
  }
}

class Incon extends StatefulWidget {
  const Incon({Key? key}) : super(key: key);

  @override
  _InconState createState() => _InconState();
}

class _InconState extends State<Incon> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [SlideImg(), Categories()],
    );
  }
}

final List<String> imgList = [
  'assets/images/news_1.png',
  'assets/images/news_2.png',
  'assets/images/news_3.png'
];

class SlideImg extends StatefulWidget {
  const SlideImg({Key? key}) : super(key: key);

  @override
  _SlideImgState createState() => _SlideImgState();
}

class _SlideImgState extends State<SlideImg> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: 187,
          viewportFraction: 0.95,
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 16 / 9),
      items: imgList
          .map((e) => ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image.asset(
                      e,
                      fit: BoxFit.contain,
                    )
                  ],
                ),
              ))
          .toList(),
    );
  }
}

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108,
      child: ListView(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 12,
        ),
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            margin: EdgeInsets.only(right: 12),
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 15),
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Color(0xff643ff9),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x40000000),
                            blurRadius: 4.0,
                          )
                        ]),
                    child: IconButton(
                        onPressed: null,
                        icon: Image.asset('assets/icons/action.png'))),
                Text(
                  'แอคชั่น',
                  textAlign: TextAlign.center,
                  maxLines: 12,
                  style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 10,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 12),
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 15),
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Color(0xff643ff9),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x40000000),
                            blurRadius: 4.0,
                          )
                        ]),
                    child: IconButton(
                        onPressed: null,
                        icon: Image.asset('assets/icons/romance.png'))),
                Text(
                  'โรแมนซ์',
                  textAlign: TextAlign.center,
                  maxLines: 12,
                  style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 10,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 12),
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 15),
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Color(0xff643ff9),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x40000000),
                            blurRadius: 4.0,
                          )
                        ]),
                    child: IconButton(
                        onPressed: null,
                        icon: Image.asset('assets/icons/fantasy.png'))),
                Text(
                  'แฟนตาซี',
                  textAlign: TextAlign.center,
                  maxLines: 12,
                  style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 10,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 12),
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 15),
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Color(0xff643ff9),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x40000000),
                            blurRadius: 4.0,
                          )
                        ]),
                    child: IconButton(
                        onPressed: null,
                        icon: Image.asset('assets/icons/drama.png'))),
                Text(
                  'ดราม่า',
                  textAlign: TextAlign.center,
                  maxLines: 12,
                  style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 10,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 12),
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 15),
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Color(0xff643ff9),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x40000000),
                            blurRadius: 4.0,
                          )
                        ]),
                    child: IconButton(
                        onPressed: null,
                        icon: Image.asset('assets/icons/lgbtq.png'))),
                Text(
                  'LGBTQ+',
                  textAlign: TextAlign.center,
                  maxLines: 12,
                  style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 10,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 12),
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 15),
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Color(0xff643ff9),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x40000000),
                            blurRadius: 4.0,
                          )
                        ]),
                    child: IconButton(
                        onPressed: null,
                        icon: Image.asset('assets/icons/horror.png'))),
                Text(
                  'สยองขวัญ',
                  textAlign: TextAlign.center,
                  maxLines: 12,
                  style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 10,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 12),
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 15),
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Color(0xff643ff9),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x40000000),
                            blurRadius: 4.0,
                          )
                        ]),
                    child: IconButton(
                        onPressed: null,
                        icon: Image.asset('assets/icons/novel.png'))),
                Text(
                  'นิยาย',
                  textAlign: TextAlign.center,
                  maxLines: 12,
                  style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 10,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 12),
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 15),
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Color(0xff643ff9),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x40000000),
                            blurRadius: 4.0,
                          )
                        ]),
                    child: IconButton(
                        onPressed: null,
                        icon: Image.asset('assets/icons/comedy.png'))),
                Text(
                  'ตลก',
                  textAlign: TextAlign.center,
                  maxLines: 12,
                  style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 10,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 15),
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Color(0xff643ff9),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x40000000),
                            blurRadius: 4.0,
                          )
                        ]),
                    child: IconButton(
                        onPressed: null,
                        icon: Image.asset('assets/icons/period.png'))),
                Text(
                  'ย้อนยุค',
                  textAlign: TextAlign.center,
                  maxLines: 12,
                  style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 10,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
