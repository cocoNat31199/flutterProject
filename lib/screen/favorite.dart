import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:merrily/component/toptab.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 92,
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              'การ์ตูนของฉัน',
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
                      Toptab(tabName: 'ถูกใจ'),
                      Toptab(tabName: 'ติดตาม'),
                      Toptab(tabName: 'อ่านล่าสุด'),
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
              Center(),
              Center(),
              Center(),
            ]),
          ),
        ));
  }
}
