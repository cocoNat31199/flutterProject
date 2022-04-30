import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:merrily/component/custombutton.dart';

class EditProfile extends StatefulWidget {
  final String userid;
  const EditProfile(this.userid);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final formKey = GlobalKey<FormState>();
  PlatformFile? pickedFile;
  File? file;
  String? displayname, urlprofile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
            'แก้ไขโปรไฟล์',
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
              child: Column(children: [
                Form(
                    key: formKey,
                    child: Column(children: [
                      Container(
                        margin: EdgeInsets.only(top: 60.0, bottom: 48),
                        child: file != null
                            ? Container(
                                width: 180,
                                height: 180,
                                child: GestureDetector(
                                    onTap: selecFile,
                                    child: ClipOval(
                                      child: Image.file(
                                        file!,
                                        width: 180,
                                        height: 180,
                                        fit: BoxFit.cover,
                                      ),
                                    )))
                            : CircleAvatar(
                                radius: 90,
                                child: IconButton(
                                  icon: Icon(Icons.add_outlined),
                                  iconSize: 32,
                                  color: Colors.black,
                                  onPressed: selecFile,
                                ),
                              ),
                      ),
                      Container(
                        child: TextFormField(
                          onChanged: (String? string) {
                            displayname = string!.trim();
                          },
                          validator:
                              RequiredValidator(errorText: 'กรุณาใส่ชื่อ'),
                          cursorColor: Color(0xff643ff9),
                          decoration: InputDecoration(
                              labelText: 'ชื่อของคุณ',
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
                        height: 32,
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                              padding: const EdgeInsets.only(bottom: 28),
                              child: SizedBox(
                                  width: double.infinity,
                                  child: CustomButton(
                                    onPressed: () async {
                                      if (formKey.currentState!.validate()) {
                                        if (file != null) {
                                          uploadFile().then((value) =>
                                              Fluttertoast.showToast(
                                                  msg: 'แก้ไขเสร็จเรียบร้อย',
                                                  gravity:
                                                      ToastGravity.BOTTOM));
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: 'กรุณาใส่ข้อมูลให้ครบ',
                                              gravity: ToastGravity.BOTTOM);
                                        }
                                      }
                                    },
                                    text: 'ต่อไป',
                                  ))))
                    ]))
              ]),
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

  Future uploadFile() async {
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference storageReference =
        firebaseStorage.ref().child('Profile/${pickedFile!.name}');
    UploadTask storageUploadTask = storageReference.putFile(file!);

    urlprofile = await (await storageUploadTask).ref.getDownloadURL();

    uploadFirestore();
  }

  Future<void> uploadFirestore() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    Map<String, dynamic> map = Map();
    map['profilepic'] = urlprofile;
    map['displayname'] = displayname;

    //Insert Data To Firestore
    firestore.collection('Userprofile').doc(widget.userid).update(map);
  }
}
