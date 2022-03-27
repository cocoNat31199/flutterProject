import 'package:flutter/material.dart';
import 'package:merrily/component/toptab.dart';

class CategoriesPage extends StatelessWidget {
  
  int selectTab;
  CategoriesPage(this.selectTab);

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
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          )),
                      child: TabBarView(children: [
                        Center(
                          child: Text('แอคชั่น'),
                        ),
                        Center(
                          child: Text('โรแมนซ์'),
                        ),
                        Center(
                          child: Text('แฟนตาซี'),
                        ),
                        Center(
                          child: Text('ดราม่า'),
                        ),
                        Center(
                          child: Text('LGBTQ+'),
                        ),
                        Center(
                          child: Text('สยองขวัญ'),
                        ),
                        Center(
                          child: Text('นิยาย'),
                        ),
                        Center(
                          child: Text('ตลก'),
                        ),
                        Center(
                          child: Text('ย้อนยุค'),
                        )
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
