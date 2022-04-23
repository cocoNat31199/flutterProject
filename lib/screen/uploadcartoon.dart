import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:merrily/component/custombutton.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  PlatformFile? pickedFile;
  PlatformFile? coverFile;
  File? file;
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
                      margin: EdgeInsets.only(top: 12),
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
                    Text('อัพโหลดไฟล์หน้าปกการ์ตูนของคุณ',
                        style: TextStyle(
                            color: Color(0xff969696),
                            fontFamily: 'Kanit',
                            fontSize: 12)),
                    GestureDetector(
                      onTap: () {
                        selecCover();
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 12),
                        height: 68,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Color(0xff969696),
                                width: 1,
                                style: BorderStyle.solid),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 1,
                                  offset: Offset(0.0, 0.75))
                            ]),
                        child: Center(
                            child: Text( coverFile != null ? '${coverFile!.name}' :
                          'แตะเพื่ออัพโหลดไฟล์ของคุณ',
                          style: TextStyle(
                              color: Colors.black45,
                              fontFamily: 'Kanit',
                              fontSize: 16),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text('อัพโหลดไฟล์การ์ตูนของคุณ',
                        style: TextStyle(
                            color: Color(0xff969696),
                            fontFamily: 'Kanit',
                            fontSize: 12)),
                    GestureDetector(
                      onTap: () {
                        selecFile();
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 12),
                        height: 68,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Color(0xff969696),
                                width: 1,
                                style: BorderStyle.solid),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 1,
                                  offset: Offset(0.0, 0.75))
                            ]),
                        child: Center(
                            child: Text( pickedFile != null ? '${pickedFile!.name}' :
                          'แตะเพื่ออัพโหลดไฟล์ของคุณ',
                          style: TextStyle(
                              color: Colors.black45,
                              fontFamily: 'Kanit',
                              fontSize: 16),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text('เลือกวันอัพโหลดการ์ตูนของคุณ',
                        style: TextStyle(
                            color: Color(0xff969696),
                            fontFamily: 'Kanit',
                            fontSize: 12)),
                    Container(
                      height: 48.0,
                      margin: EdgeInsets.only(top: 12),
                      alignment: Alignment.centerLeft,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            color: Colors.amber,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Center(
                      child: Column(
                        children: [
                          CustomButton(
                              onPressed: () {uploadFile(); uploadFiles();} ,
                              text: 'อัพโหลดการ์ตูนของฉัน'),
                          CustomButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              text: 'ยกเลิก'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )));
  }

  Future selecFile() async {
    final pickedname = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (pickedname == null) return;
    final path = pickedname.files.single.path!;

    setState(() {
      file = File(path);
      pickedFile = pickedname.files.first;
    });
  }

  Future selecCover() async{
    final pickedcover = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (pickedcover == null) return;
    final path = pickedcover.files.single.path!;

    setState(() {
      file = File(path);
      coverFile = pickedcover.files.first;
    });
  }

  Future uploadFile() async {
    final path = 'files/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
  }

  Future uploadFiles() async {
    final paths = 'files/${coverFile!.name}';
    final files = File(coverFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(paths);
    ref.putFile(files);
  }

  basename(String path) {}
}

class FirebaseApi {
  static UploadTask? uploadFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putFile(file);
    } on FirebaseException catch (e) {
      return null;
    }
  }
}
