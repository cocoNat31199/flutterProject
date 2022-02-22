import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
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
              Container(
                padding: EdgeInsets.only(right: 16),
                child: CircleAvatar(),
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
                      Tab(
                        height: 36,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "ถูกใจ",
                              style:
                                  TextStyle(fontFamily: 'Kanit', fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        height: 36,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("ติดตาม",
                                style: TextStyle(
                                    fontFamily: 'Kanit', fontSize: 14)),
                          ),
                        ),
                      ),
                      Tab(
                        height: 36,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("อ่านล่าสุด",
                                style: TextStyle(
                                    fontFamily: 'Kanit', fontSize: 14)),
                          ),
                        ),
                      )
                    ]),
              ),
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                )),
            child: TabBarView(children: [
              Center(
                child: Text('ถูกใจ'),
              ),
              Center(
                child: Text('ติดตาม'),
              ),
              Center(
                child: Text('อ่านล่าสุด'),
              ),
            ]),
          ),
        ));
  }
}
