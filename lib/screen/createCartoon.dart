import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:merrily/component/custombutton.dart';

class CreateCartoon extends StatefulWidget {
  const CreateCartoon({Key? key}) : super(key: key);

  @override
  State<CreateCartoon> createState() => _CreateCartoonState();
}

class _CreateCartoonState extends State<CreateCartoon> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: new ThemeData(
            primaryColor: Color(0xff643ff9),
            scaffoldBackgroundColor: const Color(0xff643ff9),
            fontFamily: ('Kanit ')),
        home: Scaffold(
            body: Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 56),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              )),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Stack(
                overflow: Overflow.visible,
                alignment: Alignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      // ใส่ฟังก์ชันตรงนี้
                    },
                    child: Container(
                      height: 180,
                      width: double.infinity,
                      color: Colors.amber,
                    ),
                  ),
                  Positioned(
                    bottom: -96,
                    child: GestureDetector(
                      onTap: () {
                        // ใส่ฟังก์ชันตรงนี้
                      },
                      child: Center(
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                margin: EdgeInsets.only(top: 120),
                child: TextFormField(
                  cursorColor: Color(0xff643ff9),
                  decoration: InputDecoration(
                      labelText: 'ชื่อการ์ตูน',
                      labelStyle: TextStyle(
                        fontFamily: 'Kanit',
                        fontSize: 16,
                      ),
                      floatingLabelStyle: TextStyle(
                        color: Color(0xff643ff9),
                        fontFamily: 'Kanit',
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff643ff9))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff643ff9)))),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                margin: EdgeInsets.only(top: 28),
                child: TextFormField(
                  maxLines: 5,
                  cursorColor: Color(0xff643ff9),
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                      labelText: 'รายละเอียดการ์ตูน',
                      labelStyle: TextStyle(
                        fontFamily: 'Kanit',
                        fontSize: 16,
                      ),
                      floatingLabelStyle: TextStyle(
                        color: Color(0xff643ff9),
                        fontFamily: 'Kanit',
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff643ff9))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff643ff9)))),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Center(
                  child: CustomButton(onPressed: () {}, text: 'สร้างการ์ตูน')),
              SizedBox(
                height: 12,
              ),
              Center(
                child: CustomButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: 'ยกเลิก',
                ),
              )
            ]),
          ),
        )));
  }
}
