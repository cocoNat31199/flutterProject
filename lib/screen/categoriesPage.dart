import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:merrily/component/cartoon_model.dart';
import 'package:merrily/component/toptab.dart';
import 'package:merrily/screen/cartoonPage.dart';

class CategoriesPage extends StatelessWidget {
  int selectTab;
  CategoriesPage(this.selectTab);

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: selectTab,
        length: 9,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 92,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                )),
            title: Text(
              'หมวดหมู่',
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
                      Toptab(tabName: 'แอคชั่น'),
                      Toptab(tabName: 'โรแมนซ์'),
                      Toptab(tabName: 'แฟนตาซี'),
                      Toptab(tabName: 'ดราม่า'),
                      Toptab(tabName: 'LGBTQ+'),
                      Toptab(tabName: 'สยองขวัญ'),
                      Toptab(tabName: 'นิยาย'),
                      Toptab(tabName: 'ตลก'),
                      Toptab(tabName: 'ย้อนยุค'),
                    ]),
              ),
            ),
          ),
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      width: double.infinity,
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
                                .where('UploadCategory',
                                    arrayContains: 'แอคชั่น')
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              return GridView.count(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  childAspectRatio: 9 / 16,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  children: snapshot.data!.docs.map((doc) {
                                    return CartoonModel(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CartoonPage(
                                                      doc['Name'],
                                          doc['Detail'],
                                          doc['UrlCover'],
                                          doc['UrlCartoon'],
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
                                .where('UploadCategory',
                                    arrayContains: 'โรแมนซ์')
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              return GridView.count(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  childAspectRatio: 9 / 16,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  children: snapshot.data!.docs.map((doc) {
                                    return CartoonModel(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CartoonPage(
                                                      doc['Name'],
                                          doc['Detail'],
                                          doc['UrlCover'],
                                          doc['UrlCartoon'],
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
                                .where('UploadCategory',
                                    arrayContains: 'แฟนตาซี')
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              return GridView.count(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  childAspectRatio: 9 / 16,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  children: snapshot.data!.docs.map((doc) {
                                    return CartoonModel(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CartoonPage(
                                                      doc['Name'],
                                          doc['Detail'],
                                          doc['UrlCover'],
                                          doc['UrlCartoon'],
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
                                .where('UploadCategory',
                                    arrayContains: 'ดราม่า')
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              return GridView.count(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  childAspectRatio: 9 / 16,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  children: snapshot.data!.docs.map((doc) {
                                    return CartoonModel(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CartoonPage(
                                                      doc['Name'],
                                          doc['Detail'],
                                          doc['UrlCover'],
                                          doc['UrlCartoon'],
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
                                .where('UploadCategory',
                                    arrayContains: 'LGBTQ+')
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              return GridView.count(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  childAspectRatio: 9 / 16,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  children: snapshot.data!.docs.map((doc) {
                                    return CartoonModel(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CartoonPage(
                                                      doc['Name'],
                                          doc['Detail'],
                                          doc['UrlCover'],
                                          doc['UrlCartoon'],
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
                                .where('UploadCategory',
                                    arrayContains: 'สยองขวัญ')
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              return GridView.count(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  childAspectRatio: 9 / 16,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  children: snapshot.data!.docs.map((doc) {
                                    return CartoonModel(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CartoonPage(
                                                      doc['Name'],
                                          doc['Detail'],
                                          doc['UrlCover'],
                                          doc['UrlCartoon'],
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
                                .where('UploadCategory', arrayContains: 'นิยาย')
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              return GridView.count(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  childAspectRatio: 9 / 16,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  children: snapshot.data!.docs.map((doc) {
                                    return CartoonModel(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CartoonPage(
                                                      doc['Name'],
                                          doc['Detail'],
                                          doc['UrlCover'],
                                          doc['UrlCartoon'],
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
                                .where('UploadCategory', arrayContains: 'ตลก')
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              return GridView.count(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  childAspectRatio: 9 / 16,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  children: snapshot.data!.docs.map((doc) {
                                    return CartoonModel(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CartoonPage(
                                                      doc['Name'],
                                          doc['Detail'],
                                          doc['UrlCover'],
                                          doc['UrlCartoon'],
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
                                .where('UploadCategory',
                                    arrayContains: 'ย้อนยุค')
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              return GridView.count(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  childAspectRatio: 9 / 16,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  children: snapshot.data!.docs.map((doc) {
                                    return CartoonModel(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CartoonPage(
                                                      doc['Name'],
                                          doc['Detail'],
                                          doc['UrlCover'],
                                          doc['UrlCartoon'], 
                                                    )));
                                      },
                                      src: doc['UrlCartoon'],
                                    );
                                  }).toList());
                            },
                          ),
                        ),
                      ]),
                    )),
                SizedBox(
                  height: 56,
                  width: double.infinity,
                )
              ],
            ),
          ),
        ));
  }
}
