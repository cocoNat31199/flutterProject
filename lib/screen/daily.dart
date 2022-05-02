import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:merrily/component/cartoon_model.dart';
import 'package:merrily/component/toptab.dart';
import 'package:intl/intl.dart';
import 'package:merrily/screen/cartoonPage.dart';

class Daily extends StatefulWidget {
  const Daily({Key? key}) : super(key: key);

  @override
  State<Daily> createState() => _DailyState();
}

class _DailyState extends State<Daily> {
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('EEEE');
  final String formatted = formatter.format(now);

  int _initialDay = 0;
  switchDay() {
    switch (formatted) {
      case 'Monday':
        return _initialDay = 0;
      case 'Tuesday':
        return _initialDay = 1;
      case 'Wednesday':
        return _initialDay = 2;
      case 'Thursday':
        return _initialDay = 3;
      case 'Friday':
        return _initialDay = 4;
      case 'Saturday':
        return _initialDay = 5;
      case 'Sunday':
        return _initialDay = 6;
    }
  }

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: switchDay(),
        length: 7,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 92,
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              'ประจำวัน',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Kanit', fontSize: 30),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: auth.currentUser != null
                    ? StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('Userprofile')
                            .where('UID', isEqualTo: auth.currentUser!.uid)
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return SizedBox(
                            height: 48,
                            width: 48,
                            child:
                                snapshot.data!.docs.first['profilepic'] != null
                                    ? CircleAvatar(
                                        backgroundImage: NetworkImage(snapshot
                                            .data!.docs.first['profilepic']),
                                      )
                                    : Icon(
                                        Icons.account_circle,
                                        size: 40,
                                        color: Colors.black,
                                      ),
                          );
                        })
                    : Icon(
                        Icons.account_circle,
                        size: 40,
                        color: Colors.black,
                      ),
              )
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(48),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    isScrollable: true,
                    unselectedLabelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xff643ff9)),
                    tabs: [
                      Toptab(tabName: 'จันทร์'),
                      Toptab(tabName: 'อังคาร'),
                      Toptab(tabName: 'พุธ'),
                      Toptab(tabName: 'พฤหัสบดี'),
                      Toptab(tabName: 'ศุกร์'),
                      Toptab(tabName: 'เสาร์'),
                      Toptab(tabName: 'อาทิตย์'),
                    ]),
              ),
            ),
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
            child: TabBarView(children: [
              SingleChildScrollView(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Cartoon')
                      .where('Day', isEqualTo: 1)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return GridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        childAspectRatio: 9 / 16,
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
                                            doc['UrlCartoon'],
                                            doc['UrlCover'],
                                          )));
                            },
                            src: doc['UrlCartoon'],
                          );
                        }).toList());
                  },
                ),
              ),
              SingleChildScrollView(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Cartoon')
                      .where('Day', isEqualTo: 2)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return GridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        childAspectRatio: 9 / 16,
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
                                            doc['UrlCartoon'],
                                            doc['UrlCover'],
                                          )));
                            },
                            src: doc['UrlCartoon'],
                          );
                        }).toList());
                  },
                ),
              ),
              SingleChildScrollView(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Cartoon')
                      .where('Day', isEqualTo: 3)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return GridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        childAspectRatio: 9 / 16,
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
                                            doc['UrlCartoon'],
                                            doc['UrlCover'],
                                          )));
                            },
                            src: doc['UrlCartoon'],
                          );
                        }).toList());
                  },
                ),
              ),
              SingleChildScrollView(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Cartoon')
                      .where('Day', isEqualTo: 4)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return GridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        childAspectRatio: 9 / 16,
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
                                            doc['UrlCartoon'],
                                            doc['UrlCover'],
                                          )));
                            },
                            src: doc['UrlCartoon'],
                          );
                        }).toList());
                  },
                ),
              ),
              SingleChildScrollView(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Cartoon')
                      .where('Day', isEqualTo: 5)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return GridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        childAspectRatio: 9 / 16,
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
                                            doc['UrlCartoon'],
                                            doc['UrlCover'],
                                          )));
                            },
                            src: doc['UrlCartoon'],
                          );
                        }).toList());
                  },
                ),
              ),
              SingleChildScrollView(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Cartoon')
                      .where('Day', isEqualTo: 7)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return GridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        childAspectRatio: 9 / 16,
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
                                            doc['UrlCartoon'],
                                            doc['UrlCover'],
                                          )));
                            },
                            src: doc['UrlCartoon'],
                          );
                        }).toList());
                  },
                ),
              ),
              SingleChildScrollView(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Cartoon')
                      .where('Day', isEqualTo: 7)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return GridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        childAspectRatio: 9 / 16,
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
                                            doc['UrlCartoon'],
                                            doc['UrlCover'],
                                          )));
                            },
                            src: doc['UrlCartoon'],
                          );
                        }).toList());
                  },
                ),
              ),
            ]),
          ),
        ));
  }
}
