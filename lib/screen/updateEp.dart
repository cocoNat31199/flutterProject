import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:merrily/component/custombutton.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';

class UpdateEp extends StatefulWidget {
  final String? cartoonName;

  const UpdateEp({this.cartoonName});

  @override
  State<UpdateEp> createState() => _UpdateEpState();
}

class _UpdateEpState extends State<UpdateEp> {
  String? Chaptername, ChapterNum, UrlChapter, Urlpdf;
  PlatformFile? pickedFile;
  PlatformFile? pdfFile;
  File? picfile;
  File? picpdf;
  late final _pdfName = basename(picpdf!.path);
  final auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final fileName = picpdf != null ? basename(picpdf!.path) : null;
    return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
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
                          .collection('Chapter')
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                                    onTap: () {
                                      selecFile();
                                    },
                                    child: Container(
                                        height: 120,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            color: Color(0xff969696),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: picfile != null
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.file(
                                                  picfile!,
                                                  fit: BoxFit.cover,
                                                ),
                                              )
                                            : Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 48,
                                              )),
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
                                  onChanged: (String string) {
                                    Chaptername = string.trim();
                                  },
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
                                  onChanged: (String string) {
                                    ChapterNum = string.trim();
                                  },
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
                                  onTap: () {
                                    selecpdf();
                                  },
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
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                        child: fileName != null
                                            ? Text(
                                                '$fileName',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Kanit',
                                                    fontSize: 16),
                                              )
                                            : Text(
                                                'แตะเพื่ออัพโหลดไฟล์ของคุณ',
                                                style: TextStyle(
                                                    color: Color(0xff969696),
                                                    fontFamily: 'Kanit',
                                                    fontSize: 16),
                                              )),
                                  ),
                                ),
                                SizedBox(
                                  height: 28,
                                ),
                                Center(
                                    child: CustomButton(
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            if (picfile != null &&
                                                picpdf != null) {
                                              uploadFile()
                                                  .then((value) =>
                                                      Fluttertoast.showToast(
                                                          msg: 'สร้างตอนสำเร็จ',
                                                          gravity: ToastGravity
                                                              .BOTTOM))
                                                  .then((value) =>
                                                      Navigator.pop(context));
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg: 'กรุณาใส่ข้อมูลให้ครบ',
                                                  gravity: ToastGravity.BOTTOM);
                                            }
                                          }
                                        },
                                        text: 'เพิ่มตอน')),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            ));
                      },
                    ),
                  ))),
        );
  }

  Future selecFile() async {
    final pickedname = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg'],
    );

    if (pickedname == null) return;
    final path = pickedname.files.single.path!;

    setState(() {
      picfile = File(path);
      pickedFile = pickedname.files.first;
    });
  }

  Future selecpdf() async {
    final pickedpdf = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (pickedpdf == null) return;
    final path = pickedpdf.files.single.path!;

    setState(() {
      picpdf = File(path);
      pdfFile = pickedpdf.files.first;
    });
  }

  Future uploadFile() async {
    if (picpdf == null) return;

    final fileName = basename(picpdf!.path);
    final destination = 'Chapter/$fileName';

    FirebaseApi.uploadFile(destination, picpdf!);

    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference storageReference =
        firebaseStorage.ref().child('Chapter/${pickedFile!.name}');
    UploadTask storageUploadTask = storageReference.putFile(picfile!);

    UrlChapter = await (await storageUploadTask).ref.getDownloadURL();

    FirebaseStorage firebaseStorageC = FirebaseStorage.instance;
    Reference storageReferenceC =
        firebaseStorageC.ref().child('Chapter/${pdfFile!.name}');
    UploadTask storageUploadTaskC = storageReferenceC.putFile(picpdf!);

    Urlpdf = await (await storageUploadTaskC).ref.getDownloadURL();

    uploadFirestore();
  }

  Future<void> uploadFirestore() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    Map<String, dynamic> map = Map();
    map['Chaptername'] = Chaptername;
    map['ChapterNum'] = ChapterNum;
    map['Chapterurl'] = UrlChapter;
    map['Storyurl'] = Urlpdf;

    //Insert Data To Firestore
    firestore
        .collection('Cartoon')
        .doc(widget.cartoonName)
        .collection("Chapter")
        .doc(ChapterNum)
        .set(map);
  }
}

class FirebaseApi {
  static UploadTask? uploadFile(String destination, File picpdf) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putFile(picpdf);
    } on FirebaseException catch (e) {
      return null;
    }
  }
}
