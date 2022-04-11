import 'package:flutter/material.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: new ThemeData(
            primaryColor: Color(0xff643ff9),
            scaffoldBackgroundColor: const Color(0xff643ff9),
            fontFamily: ('Kanit ')),
        home: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0.0,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  )),
              title: Text(
                'อัพโหลดการ์ตูน',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Kanit',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            body: Container(
              height: double.infinity,
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 56),
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  )),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    Text('รายละเอียดการ์ตูน',
                        style: TextStyle(
                            color: Color(0xff969696),
                            fontFamily: 'Kanit',
                            fontSize: 12)),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: TextFormField(
                        cursorColor: Color(0xff643ff9),
                        decoration: InputDecoration(
                            labelText: 'ชื่อตอน',
                            labelStyle: TextStyle(
                              fontFamily: 'Kanit',
                              fontSize: 16,
                            ),
                            floatingLabelStyle: TextStyle(
                              color: Color(0xff643ff9),
                              fontFamily: 'Kanit',
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff643ff9))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff643ff9)))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: TextFormField(
                        cursorColor: Color(0xff643ff9),
                        decoration: InputDecoration(
                            labelText: 'ตอนของการ์ตูน',
                            labelStyle: TextStyle(
                              fontFamily: 'Kanit',
                              fontSize: 16,
                            ),
                            floatingLabelStyle: TextStyle(
                              color: Color(0xff643ff9),
                              fontFamily: 'Kanit',
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff643ff9))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff643ff9)))),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text('อัพโหลดการ์ตูน',
                        style: TextStyle(
                            color: Color(0xff969696),
                            fontFamily: 'Kanit',
                            fontSize: 12)),
                  ],
                ),
              ),
            )));
  }
}
