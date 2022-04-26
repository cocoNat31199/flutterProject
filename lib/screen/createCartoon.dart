import 'dart:core';
import 'dart:ffi';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:merrily/component/customRadio.dart';
import 'package:merrily/component/custombutton.dart';

class CreateCartoon extends StatefulWidget {
  const CreateCartoon({Key? key}) : super(key: key);

  @override
  State<CreateCartoon> createState() => _CreateCartoonState();
}

class _CreateCartoonState extends State<CreateCartoon> {
  PlatformFile? pickedFile;
  PlatformFile? coverFile;
  File? file;
  File? cover;
  UploadTask? uploadTask;
  String? name, detail, urlCartoon, urlCover;
  final _formKey = GlobalKey<FormState>();

  Map<String, bool> List = {
    'แอคชั่น': false,
    'โรแมนซ์': false,
    'แฟนตาซี': false,
    'ดราม่า': false,
    'LGBTQ+': false,
    'สยองขวัญ': false,
    'นิยาย': false,
    'ตลก': false,
    'ย้อนยุค': false,
  };

  var uploadCategory = [];

  getCategory() {
    List.forEach((key, value) {
      if (value == true) {
        uploadCategory.add(key);
      }
    });
  }

  int _value = 1;

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
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: selecCover,
                      child: Container(
                        height: 180,
                        width: double.infinity,
                        color: Color(0xff969696),
                        child: cover != null
                            ? ClipRRect(
                                child: Image.file(
                                  cover!,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 48,
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: selecFile,
                        child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                color: Color(0xff969696),
                                borderRadius: BorderRadius.circular(10)),
                            child: file != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      file!,
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
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      margin: EdgeInsets.only(top: 28),
                      child: TextFormField(
                        onChanged: (String string) {
                          name = string.trim();
                        },
                        validator:
                            RequiredValidator(errorText: 'กรุณาใส่ชื่อเรื่อง'),
                        cursorColor: Color(0xff643ff9),
                        style: TextStyle(fontFamily: 'Kanit'),
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
                                borderSide:
                                    BorderSide(color: Color(0xff643ff9))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff643ff9)))),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      margin: EdgeInsets.only(top: 28),
                      child: TextFormField(
                        onChanged: ((value) {
                          detail = value.trim();
                        }),
                        onSaved: (String? putdetail) {
                          detail = putdetail;
                        },
                        validator: RequiredValidator(
                            errorText: 'กรุณาใส่รายละเอียดการ์ตูน'),
                        maxLines: 5,
                        style: TextStyle(fontFamily: 'Kanit'),
                        cursorColor: Color(0xff643ff9),
                        textAlignVertical: TextAlignVertical.top,
                        decoration: InputDecoration(
                            alignLabelWithHint: true,
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
                                borderSide:
                                    BorderSide(color: Color(0xff643ff9))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff643ff9)))),
                      ),
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'หมวดหมู่ของการ์ตูน',
                        style: TextStyle(
                            color: Color(0xff969696),
                            fontFamily: 'Kanit',
                            fontSize: 12),
                      ),
                    ),
                    Column(
                      children: List.keys.map((String key) {
                        return Container(
                          height: 52,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 0.5, color: Color(0x33969696)))),
                          child: new CheckboxListTile(
                            title: new Text(
                              key,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Kanit',
                                  fontSize: 16),
                            ),
                            value: List[key],
                            activeColor: Color(0xff643ff9),
                            checkColor: Colors.white,
                            onChanged: (bool? value) {
                              setState(() {
                                List[key] = value!;
                              });
                            },
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'วันอัพโหลดการฺฺ์ตูน',
                        style: TextStyle(
                            color: Color(0xff969696),
                            fontFamily: 'Kanit',
                            fontSize: 12),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12),
                      height: 48,
                      alignment: Alignment.centerLeft,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        children: [
                          CustomRadioList<int>(
                              value: 1,
                              groupValue: _value,
                              leading: 'จ.',
                              onChange: (value) =>
                                  setState(() => _value = value!)),
                          SizedBox(
                            width: 12,
                          ),
                          CustomRadioList<int>(
                              value: 2,
                              groupValue: _value,
                              leading: 'อ.',
                              onChange: (value) =>
                                  setState(() => _value = value!)),
                          SizedBox(
                            width: 12,
                          ),
                          CustomRadioList<int>(
                              value: 3,
                              groupValue: _value,
                              leading: 'พ.',
                              onChange: (value) =>
                                  setState(() => _value = value!)),
                          SizedBox(
                            width: 12,
                          ),
                          CustomRadioList<int>(
                              value: 4,
                              groupValue: _value,
                              leading: 'พฤ.',
                              onChange: (value) =>
                                  setState(() => _value = value!)),
                          SizedBox(
                            width: 12,
                          ),
                          CustomRadioList<int>(
                              value: 5,
                              groupValue: _value,
                              leading: 'ศ.',
                              onChange: (value) =>
                                  setState(() => _value = value!)),
                          SizedBox(
                            width: 12,
                          ),
                          CustomRadioList<int>(
                              value: 6,
                              groupValue: _value,
                              leading: 'ส.',
                              onChange: (value) =>
                                  setState(() => _value = value!)),
                          SizedBox(
                            width: 12,
                          ),
                          CustomRadioList<int>(
                              value: 7,
                              groupValue: _value,
                              leading: 'อา.',
                              onChange: (value) =>
                                  setState(() => _value = value!)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Center(
                        child: CustomButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                getCategory();
                                if (cover != null &&
                                    file != null &&
                                    uploadCategory.isNotEmpty == true) {
                                  uploadFile();
                                  uploadFiles();
                                  Fluttertoast.showToast(
                                          msg: 'สร้างการ์ตูนสำเร็จ',
                                          gravity: ToastGravity.BOTTOM)
                                      .then((value) => Navigator.pop(context));
                                } else {
                                  Fluttertoast.showToast(
                                          msg: 'กรุณาใส่ข้อมูลให้ครบ',
                                          gravity: ToastGravity.BOTTOM)
                                      .then((value) {
                                    uploadCategory.clear();
                                  });
                                }
                              } else {
                                Fluttertoast.showToast(
                                    msg: 'กรุณาใส่ข้อมูลให้ครบ',
                                    gravity: ToastGravity.BOTTOM);
                              }
                            },
                            text: 'สร้างการ์ตูน')),
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
          ),
        )));
  }

  Future selecFile() async {
    final pickedname = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg'],
    );

    if (pickedname == null) return;
    final path = pickedname.files.single.path!;

    setState(() {
      file = File(path);
      pickedFile = pickedname.files.first;
    });
  }

  Future selecCover() async {
    final pickedcover = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg'],
    );

    if (pickedcover == null) return;
    final path = pickedcover.files.single.path!;

    setState(() {
      cover = File(path);
      coverFile = pickedcover.files.first;
    });
  }

  Future uploadFile() async {
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference storageReference = firebaseStorage.ref().child('Cartoon/${pickedFile!.name}');
    UploadTask storageUploadTask = storageReference.putFile(file!);

    urlCartoon = await (await storageUploadTask).ref.getDownloadURL();
    print('Cartoon URL = $urlCartoon');
    uploadFirestore();
  }

  Future uploadFiles() async {
    FirebaseStorage firebaseStorageC = FirebaseStorage.instance;
    Reference storageReferenceC = firebaseStorageC.ref().child('Cartoon/${coverFile!.name}');
    UploadTask storageUploadTaskC = storageReferenceC.putFile(cover!);

    urlCover = await (await storageUploadTaskC).ref.getDownloadURL();
    print('Cover URL: $urlCover');
  }

  Future<void> uploadFirestore() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    Map<String, dynamic> map = Map();
    map['Name'] = name;
    map['Detail'] = detail;
    map['UrlCartoon'] = urlCartoon;
    map['UrlCover'] = urlCover;
    map['UploadCategory'] = uploadCategory;
    map['Category'] = _value;

    //Insert Data To Firestore
    firestore.collection('Cartoon').doc().set(map).then((v) {});
  }
}
