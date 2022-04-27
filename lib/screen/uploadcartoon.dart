import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:merrily/screen/allEpCartoon.dart';
import 'package:merrily/screen/createCartoon.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:merrily/screen/updateEp.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final auth = FirebaseAuth.instance;
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
                  Text(
                    'การ์ตูนทั้งหมด',
                    style: TextStyle(
                        color: Color(0xff969696),
                        fontFamily: 'Kanit',
                        fontSize: 12),
                  ),
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('Cartoon')
                          .where('userid', isEqualTo: auth.currentUser!.uid)
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return CircularProgressIndicator();
                        }
                        return ListView(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.only(bottom: 28),
                          shrinkWrap: true,
                          children: snapshot.data!.docs.map((doc) {
                            return Card(
                              color: Color(0xff643ff9),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: ((context) => AllEpCartoon(cartoonName: '${doc['Name']}',))));
                                  },
                                  child: SizedBox(
                                      height: 72,
                                      child: Row(
                                        children: [
                                          AspectRatio(
                                            aspectRatio: 1,
                                            child: Image.network(
                                              doc['UrlCartoon'],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(width: 12),
                                          Center(
                                            child: Text(doc['Name'],
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Kanit',
                                                )),
                                          )
                                        ],
                                      ))),
                            );
                          }).toList(),
                        );
                      }),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
          floatingActionButton: Container(
            margin: EdgeInsets.only(bottom: 56),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateCartoon()));
              },
              backgroundColor: Color(0xff643ff9),
              child: Icon(
                Icons.add_outlined,
                size: 36,
              ),
            ),
          ),
        ));
  }
}
