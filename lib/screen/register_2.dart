import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:merrily/component/custombutton.dart';
import 'package:merrily/component/user.dart';

class Register_2 extends StatefulWidget {
  final String userid;

  const Register_2(this.userid);

  @override
  State<Register_2> createState() => _Register_2State();
}

class _Register_2State extends State<Register_2> {
  PlatformFile? pickedFile;
  File? file;
  String? displayname, urlprofile;
  // File? image;
  // PickedFile? _imageFile;
  // final ImagePicker _picker = ImagePicker();
  Usermerrily user = Usermerrily();

  final formKey = GlobalKey<FormState>();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
            primaryColor: Color(0xff643ff9),
            scaffoldBackgroundColor: const Color(0xff643ff9),
            fontFamily: ('Kanit ')),
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              bottom: PreferredSize(
                child: Container(
                  color: Color(0xff643ff9),
                  height: 1.0,
                ),
                preferredSize: Size.fromHeight(1.0),
              ),
              title: Text(
                'สมัครสมาชิก',
                style: TextStyle(
                    color: Colors.black, fontFamily: 'Kanit', fontSize: 20),
              ),
            ),
            body: Padding(
                padding: const EdgeInsets.only(bottom: 56),
                child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Column(children: [
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
                              child: SingleChildScrollView(
                                  child: Column(children: [
                                Form(
                                    key: formKey,
                                    child: Column(children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 60.0, bottom: 48),
                                        child: file != null
                                            ? Container(width: 180,height: 180,child: GestureDetector(onTap: selecFile,child: ClipOval(child: Image.file(file!,width: 180,height: 180,fit: BoxFit.cover,),)))
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
                                                  borderSide: BorderSide(
                                                      color:
                                                          Color(0xff643ff9))),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Color(0xff643ff9)))),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 32,
                                      ),
                                      Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 28),
                                              child: SizedBox(
                                                  width: double.infinity,
                                                  child: CustomButton(
                                                    onPressed: () async {uploadFile();},
                                                    text: 'ต่อไป',
                                                  ))))
                                    ]))
                              ]))))
                    ])))));
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
    map['UID'] = widget.userid;
    map['profilepic'] = urlprofile;
    map['displayname'] = displayname;

    //Insert Data To Firestore
    firestore
        .collection('Userprofile')
        .doc(widget.userid)
        .set(map);
  }
}