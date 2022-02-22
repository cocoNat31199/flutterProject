import 'package:flutter/material.dart';

class Daily extends StatefulWidget {
  const Daily({Key? key}) : super(key: key);

  @override
  _DailyState createState() => _DailyState();
}

class _DailyState extends State<Daily> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
                            child: Text("จันทร์",
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
                            child: Text("อังคาร",
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
                            child: Text("พุธ",
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
                            child: Text("พฤหัสบดี",
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
                            child: Text("ศุกร์",
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
                            child: Text("เสาร์",
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
                            child: Text("อาทิตย์",
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
                            child: Text("จบ",
                                style: TextStyle(
                                    fontFamily: 'Kanit', fontSize: 14)),
                          ),
                        ),
                      ),
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
