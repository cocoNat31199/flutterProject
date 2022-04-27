import 'package:flutter/material.dart';

class UpdartEp extends StatefulWidget {
  const UpdartEp({Key? key}) : super(key: key);

  @override
  State<UpdartEp> createState() => _UpdartEpState();
}

class _UpdartEpState extends State<UpdartEp> {
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
                child: SingleChildScrollView())));
  }
}
