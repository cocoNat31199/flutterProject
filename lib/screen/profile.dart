import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:merrily/component/custombutton.dart';
import 'package:merrily/main.dart';
import 'package:merrily/screen/editProfile.dart';
import 'package:merrily/screen/historyGift.dart';
import 'package:merrily/screen/setting.dart';
import 'package:merrily/screen/unloginpage.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              )),
          child: ProfileContent()),
    );
  }
}

class ProfileContent extends StatefulWidget {
  const ProfileContent({Key? key}) : super(key: key);

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  final auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: 96,
              ),
              CircleAvatar(
                backgroundImage: NetworkImage('${auth.currentUser?.photoURL}'),
                radius: 60,
              ),
              Text(
                '${auth.currentUser!.email}',
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
                onTap: () {},
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
                      auth.signOut().then((value) => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: ((context) => MyApp()))));
                      googleSignIn.signOut().then((value) =>
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => MyApp()))));
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
