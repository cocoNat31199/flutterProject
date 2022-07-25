import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:merrily/component/cartoon_model.dart';
import 'package:merrily/component/categoriesbutton.dart';
import 'package:merrily/screen/cartoonPage.dart';
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
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: auth.currentUser != null
              ? StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Userprofile')
                      .where('UID', isEqualTo: auth.currentUser!.uid)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ClipOval(
                      child: snapshot.data!.docs.first['profilepic'] != null
                          ? Image.network(
                              snapshot.data!.docs.first['profilepic'],
                              fit: BoxFit.cover,
                            )
                          : null,
                    );
                  })
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
              Navigator.push(
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
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 28),
      child: Column(
        children: [
          SlideImg(),
          Categories(),
          ReadLatest(),
          Recommend(),
          TopRating(),
          NewToon(),
          UpdateToon(),
        ],
      ),
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
          height: 156,
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
      alignment: Alignment.centerLeft,
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
            height: 200,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Cartoon')
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }
                  return GridView.count(
                      crossAxisCount: 1,
                      mainAxisSpacing: 10,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      childAspectRatio: 16 / 9,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      children: snapshot.data!.docs.map((doc) {
                        return CartoonModel(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CartoonPage(
                                          doc['Name'],
                                          doc['Detail'],
                                          doc['UrlCover'],
                                          doc['UrlCartoon'],
                                        )));
                          },
                          src: doc['UrlCartoon'],
                        );
                      }).toList());
                }))
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
            height: 200,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Cartoon')
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }
                  return GridView.count(
                      crossAxisCount: 1,
                      mainAxisSpacing: 10,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      childAspectRatio: 16 / 9,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      children: snapshot.data!.docs.map((doc) {
                        return CartoonModel(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CartoonPage(
                                          doc['Name'],
                                          doc['Detail'],
                                          doc['UrlCover'],
                                          doc['UrlCartoon'],
                                        )));
                          },
                          src: doc['UrlCartoon'],
                        );
                      }).toList());
                }))
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
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Cartoon')
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Column(
                        children: snapshot.data!.docs.map((doc) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CartoonPage(
                                        doc['Name'],
                                        doc['Detail'],
                                        doc['UrlCover'],
                                        doc['UrlCartoon'],
                                      )));
                        },
                        child: Container(
                          height: 136,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(doc['UrlCartoon']),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      );
                    }).toList()),
                  );
                }))
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
            height: 200,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Cartoon')
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }
                  return GridView.count(
                      crossAxisCount: 1,
                      mainAxisSpacing: 10,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      childAspectRatio: 16 / 9,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      children: snapshot.data!.docs.map((doc) {
                        return CartoonModel(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CartoonPage(
                                          doc['Name'],
                                          doc['Detail'],
                                          doc['UrlCover'],
                                          doc['UrlCartoon'],
                                        )));
                          },
                          src: doc['UrlCartoon'],
                        );
                      }).toList());
                }))
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
            height: 200,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Cartoon')
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }
                  return GridView.count(
                      crossAxisCount: 1,
                      mainAxisSpacing: 10,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      childAspectRatio: 16 / 9,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      children: snapshot.data!.docs.map((doc) {
                        return CartoonModel(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CartoonPage(
                                          doc['Name'],
                                          doc['Detail'],
                                          doc['UrlCover'],
                                          doc['UrlCartoon'],
                                        )));
                          },
                          src: doc['UrlCartoon'],
                        );
                      }).toList());
                }))
      ],
    );
  }
}
