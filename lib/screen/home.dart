import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:merrily/component/categoriesbutton.dart';
import 'package:merrily/screen/categoriesPage.dart';
import 'package:merrily/screen/searchpage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.only(left: 16),
          child: auth.currentUser != null
              ? CircleAvatar(
                  radius: 24,
                  child: ClipOval(
                      child: auth.currentUser!.photoURL != null
                          ? Image.network(
                              '${auth.currentUser!.photoURL}',
                              fit: BoxFit.contain,
                            )
                          : null))
              : Icon(
                  Icons.account_circle,
                  size: 40,
                  color: Colors.black,
                ),
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
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
          ),
        ],
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
    return ListView(
      // shrinkWrap: true,
      children: [
        SlideImg(),
        Categories(),
        ReadLatest(),
        Recommend(),
        TopRating(),
        NewToon(),
        UpdateToon()
      ],
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
      alignment: Alignment.center,
      constraints: BoxConstraints(minHeight: 108),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 12,
        ),
        scrollDirection: Axis.horizontal,
        children: [
          CategoriesButton(
            imageName: 'assets/icons/action.png',
            name: 'แอคชั่น',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => CategoriesPage(0))));
            },
          ),
          SizedBox(
            width: 12,
          ),
          CategoriesButton(
            imageName: 'assets/icons/romance.png',
            name: 'โรแมนซ์',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => CategoriesPage(1))));
            },
          ),
          SizedBox(
            width: 12,
          ),
          CategoriesButton(
            imageName: 'assets/icons/fantasy.png',
            name: 'แฟนตาซี',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => CategoriesPage(2))));
            },
          ),
          SizedBox(
            width: 12,
          ),
          CategoriesButton(
            imageName: 'assets/icons/drama.png',
            name: 'ดราม่า',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => CategoriesPage(3))));
            },
          ),
          SizedBox(
            width: 12,
          ),
          CategoriesButton(
            imageName: 'assets/icons/lgbtq.png',
            name: 'LGBTQ+',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => CategoriesPage(4))));
            },
          ),
          SizedBox(
            width: 12,
          ),
          CategoriesButton(
            imageName: 'assets/icons/horror.png',
            name: 'สยองขวัญ',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => CategoriesPage(5))));
            },
          ),
          SizedBox(
            width: 12,
          ),
          CategoriesButton(
            imageName: 'assets/icons/novel.png',
            name: 'นิยาย',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => CategoriesPage(6))));
            },
          ),
          SizedBox(
            width: 12,
          ),
          CategoriesButton(
            imageName: 'assets/icons/comedy.png',
            name: 'ตลก',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => CategoriesPage(7))));
            },
          ),
          SizedBox(
            width: 12,
          ),
          CategoriesButton(
            imageName: 'assets/icons/period.png',
            name: 'ย้อนยุค',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => CategoriesPage(8))));
            },
          ),
        ],
      ),
    );
  }
}

class ReadLatest extends StatefulWidget {
  const ReadLatest({Key? key}) : super(key: key);

  @override
  State<ReadLatest> createState() => _ReadLatestState();
}

class _ReadLatestState extends State<ReadLatest> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 16),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'อ่านล่าสุด',
              style: TextStyle(fontFamily: 'Kanit', fontSize: 24),
            ),
          ),
        ),
        Container(
          height: 174,
          constraints: BoxConstraints(minHeight: 174),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: ListView(
              scrollDirection: Axis.horizontal, shrinkWrap: true, children: []),
        )
      ],
    );
  }
}

class Recommend extends StatefulWidget {
  const Recommend({Key? key}) : super(key: key);

  @override
  State<Recommend> createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 16),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'แนะนำ',
              style: TextStyle(fontFamily: 'Kanit', fontSize: 24),
            ),
          ),
        ),
        Container(
          height: 174,
          constraints: BoxConstraints(minHeight: 174),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: ListView(
              scrollDirection: Axis.horizontal, shrinkWrap: true, children: []),
        )
      ],
    );
  }
}

class TopRating extends StatefulWidget {
  const TopRating({Key? key}) : super(key: key);

  @override
  State<TopRating> createState() => _TopRatingState();
}

class _TopRatingState extends State<TopRating> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 16),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              '10 อันดับยอดฮิต',
              style: TextStyle(fontFamily: 'Kanit', fontSize: 24),
            ),
          ),
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              children: [
                Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(children: [
                      Container(
                        height: 48,
                        width: 48,
                        color: Colors.red,
                      ),
                      Container(height: 48, width: 48, color: Colors.green),
                      Container(height: 48, width: 48, color: Colors.blue)
                    ]),
                    TableRow(children: [
                      Container(
                        height: 48,
                        width: 48,
                        color: Colors.green,
                      ),
                      Container(height: 48, width: 48, color: Colors.blue),
                      Container(height: 48, width: 48, color: Colors.red)
                    ]),
                    TableRow(children: [
                      Container(
                        height: 48,
                        width: 48,
                        color: Colors.blue,
                      ),
                      Container(height: 48, width: 48, color: Colors.red),
                      Container(height: 48, width: 48, color: Colors.green)
                    ])
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text('ดูเพิ่มเติม'),
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xff643ff9),
                          elevation: 0.0,
                          textStyle: TextStyle(
                              fontFamily: 'Kanit',
                              fontSize: 18,
                              color: Colors.white))),
                )
              ],
            ))
      ],
    );
  }
}

class NewToon extends StatefulWidget {
  const NewToon({Key? key}) : super(key: key);

  @override
  State<NewToon> createState() => _NewToonState();
}

class _NewToonState extends State<NewToon> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 16),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'การ์ตูนใหม่',
              style: TextStyle(fontFamily: 'Kanit', fontSize: 24),
            ),
          ),
        ),
        Container(
          height: 174,
          constraints: BoxConstraints(minHeight: 174),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: ListView(
              scrollDirection: Axis.horizontal, shrinkWrap: true, children: []),
        ),
      ],
    );
  }
}

class UpdateToon extends StatefulWidget {
  const UpdateToon({Key? key}) : super(key: key);

  @override
  State<UpdateToon> createState() => _UpdateToonState();
}

class _UpdateToonState extends State<UpdateToon> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 16),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'ตอนใหม่มาแล้ว',
              style: TextStyle(fontFamily: 'Kanit', fontSize: 24),
            ),
          ),
        ),
        Container(
          height: 174,
          constraints: BoxConstraints(minHeight: 174),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: ListView(
              scrollDirection: Axis.horizontal, shrinkWrap: true, children: []),
        )
      ],
    );
  }
}
