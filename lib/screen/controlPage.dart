import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:merrily/component/custombutton.dart';
import 'package:merrily/main.dart';
import 'package:merrily/screen/addCoin.dart';
import 'package:merrily/screen/editProfile.dart';
import 'package:merrily/screen/historyGift.dart';
import 'package:merrily/screen/login.dart';
import 'package:merrily/screen/setting.dart';
import 'package:merrily/screen/uploadcartoon.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({Key? key}) : super(key: key);

  @override
  _ControlPageState createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              )),
          child: auth.currentUser != null ? Profile() : UnloginContent()),
    );
  }
}

class UnloginContent extends StatefulWidget {
  const UnloginContent({Key? key}) : super(key: key);

  @override
  State<UnloginContent> createState() => _UnloginContentState();
}

class _UnloginContentState extends State<UnloginContent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: Icon(
                Icons.account_circle,
                size: 120.0,
              ),
            ),
            Text(
              'User',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Kanit',
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '#xxxx',
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Kanit', fontSize: 16),
            ),
            Container(
                margin: EdgeInsets.only(top: 68),
                child: SizedBox(
                    height: 36,
                    child: CustomButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        text: 'เข้าสู่ระบบ'))),
          ],
        ),
      ),
    );
  }
}

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future signOut() async {
    await googleSignIn.signOut();
    await FacebookAuth.instance.logOut();
    await auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              ClipOval(
                  child: auth.currentUser!.photoURL != null
                      ? Image.network(
                          '${auth.currentUser!.photoURL}',
                          height: 100,
                          width: 100,
                          fit: BoxFit.contain,
                        )
                      : Container(
                          height: 100,
                          width: 100,
                          color: Colors.black,
                        )),
              Text(
                '${auth.currentUser!.displayName}',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Kanit',
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '#xxxx',
                style: TextStyle(
                    color: Colors.black, fontFamily: 'Kanit', fontSize: 16),
              ),
              GestureDetector(
                onTap: () {Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Addcoin()));},
                child: Container(
                  height: 52,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 0.5, color: Color(0x33969696)))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('เหรียญของคุณ',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Kanit',
                              fontSize: 16)),
                      Text('฿ 300',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Kanit',
                              fontSize: 16))
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HistoryGift()));
                },
                child: Container(
                  height: 52,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 0.5, color: Color(0x33969696)))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('ประวัติการส่งของขวัญ',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Kanit',
                              fontSize: 16)),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()));
                },
                child: Container(
                  height: 52,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 0.5, color: Color(0x33969696)))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('แก้ไขโปรไฟล์',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Kanit',
                              fontSize: 16)),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UploadPage()));
                },
                child: Container(
                  height: 52,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 0.5, color: Color(0x33969696)))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('อัพโหลดการ์ตูน',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Kanit',
                              fontSize: 16)),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Setting()));
                },
                child: Container(
                  height: 52,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 0.5, color: Color(0x33969696)))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('ตั้งค่า',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Kanit',
                              fontSize: 16)),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(
                    onPressed: () {
                      signOut().then((value) => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp())));
                    },
                    text: 'ออกจากระบบ',
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
