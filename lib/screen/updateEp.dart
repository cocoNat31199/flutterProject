import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:merrily/component/custombutton.dart';

class UpdateEp extends StatefulWidget {
  final String cartoonName;

  const UpdateEp({required this.cartoonName});

  @override
  State<UpdateEp> createState() => _UpdateEpState();
}

class _UpdateEpState extends State<UpdateEp> {
  String? Chaptername, ChapterNum, UrlChapter;
  File? pdffile;
  final auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

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
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('Cartoon')
                        .where('userid', isEqualTo: auth.currentUser!.uid)
                        .where('Name', isEqualTo: widget.cartoonName)
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'เลือกรูปตอนการ์ตูนของคุณ',
                                style: TextStyle(
                                    color: Color(0xff969696),
                                    fontFamily: 'Kanit',
                                    fontSize: 12),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Center(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                      height: 120,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          color: Color(0xff969696),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 48,
                                      )
                                      // cover != null
                                      //     ? ClipRRect(
                                      //         child: Image.file(
                                      //           cover!,
                                      //           fit: BoxFit.cover,
                                      //         ),
                                      //       )
                                      //     : Icon(
                                      //         Icons.add,
                                      //         color: Colors.white,
                                      //         size: 48,
                                      //       ),
                                      ),
                                ),
                              ),
                              SizedBox(
                                height: 28,
                              ),
                              Text(
                                'รายละเอียดของตอน',
                                style: TextStyle(
                                    color: Color(0xff969696),
                                    fontFamily: 'Kanit',
                                    fontSize: 12),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              TextFormField(
                                onChanged: (String string) {},
                                validator: RequiredValidator(
                                    errorText: 'กรุณาใส่ชื่อตอน'),
                                cursorColor: Color(0xff643ff9),
                                style: TextStyle(fontFamily: 'Kanit'),
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
                                        borderSide: BorderSide(
                                            color: Color(0xff643ff9))),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff643ff9)))),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                onChanged: (String string) {},
                                validator: RequiredValidator(
                                    errorText: 'กรุณาใส่ลำดับตอน'),
                                cursorColor: Color(0xff643ff9),
                                keyboardType: TextInputType.number,
                                style: TextStyle(fontFamily: 'Kanit'),
                                decoration: InputDecoration(
                                    labelText: 'ลำดับตอน',
                                    labelStyle: TextStyle(
                                      fontFamily: 'Kanit',
                                      fontSize: 16,
                                    ),
                                    floatingLabelStyle: TextStyle(
                                      color: Color(0xff643ff9),
                                      fontFamily: 'Kanit',
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff643ff9))),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff643ff9)))),
                              ),
                              SizedBox(
                                height: 28,
                              ),
                              Text(
                                'อัพโหลดไฟล์การ์ตูนของคุณ',
                                style: TextStyle(
                                    color: Color(0xff969696),
                                    fontFamily: 'Kanit',
                                    fontSize: 12),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border:
                                        Border.all(color: Color(0xff969696)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text('แตะเพื่อเลือกไฟล์',
                                        style: TextStyle(
                                            color: Color(0xff969696),
                                            fontFamily: 'Kanit',
                                            fontSize: 16)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 28,
                              ),
                              Center(
                                  child: CustomButton(
                                      onPressed: () {}, text: 'เพิ่มตอน')),
                              Center(
                                child: CustomButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  text: 'ยกเลิก',
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          ));
                    },
                  ),
                ))));
  }

  Future<void> uploadFirestore() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    Map<String, dynamic> map = Map();
    map['userid'] = Chaptername;
    map['UrlCover'] = ChapterNum;
    map['UrlCartoon'] = UrlChapter;
    map['URL'] = pdffile;

    //Insert Data To Firestore
    firestore.collection('Cartoon').doc().collection("Chapter").doc().set(map);
  }
}
