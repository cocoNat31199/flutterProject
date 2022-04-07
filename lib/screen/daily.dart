import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:merrily/component/toptab.dart';
import 'package:intl/intl.dart';

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
        length: 8,
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
              Container(
                padding: EdgeInsets.only(right: 16),
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
                        size: 48,
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
                      Toptab(tabName: 'จบ'),
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
              Center(
                child: Text('วันจันทร์'),
              ),
              Center(
                child: Text('วันอังคาร'),
              ),
              Center(
                child: Text('วันพุธ'),
              ),
              Center(
                child: Text('วันพฤหัสบดี'),
              ),
              Center(
                child: Text('วันศุกร์'),
              ),
              Center(
                child: Text('วันเสาร์'),
              ),
              Center(
                child: Text('วันอาทิตย์'),
              ),
              Center(
                child: Text('จบแล้ว'),
              ),
            ]),
          ),
        ));
  }
}
