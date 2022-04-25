import 'dart:ffi';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
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
  String? name, detail, urlPicture;
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
              GestureDetector(
                onTap: () {
                  // ใส่ฟังก์ชันตรงนี้
                },
                child: Container(
                  height: 180,
                  width: double.infinity,
                  color: Color(0xff969696),
                  child: Icon(
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
                  onChanged: ((value) {
                    detail = value.trim();
                  }),
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
                  child: CustomButton(
                      onPressed: uploadFile, text: 'สร้างการ์ตูน')),
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

  Future selecCover() async {
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
    final path = 'Cartoon/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);

    UploadTask uploadTask = ref.putFile(file);
    uploadFirestore();
    print('Insert Success');
  }

  Future<void> uploadFirestore() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    Map<String, dynamic> map = Map();
    map['Name'] = name;
    map['Detail'] = detail;
    map['UrlPicture'] = urlPicture;

    //Insert Data To Firestore
    firestore
    .collection('Cartoon')
    .doc()
    .set(map)
    .then((v) {});
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
