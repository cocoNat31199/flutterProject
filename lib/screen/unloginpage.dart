import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:merrily/component/custombutton.dart';
import 'package:merrily/screen/login.dart';

class Unlogin extends StatefulWidget {
  const Unlogin({Key? key}) : super(key: key);

  @override
  _UnloginState createState() => _UnloginState();
}

class _UnloginState extends State<Unlogin> {
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
        child: UnloginContent(),
      ),
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
                          Navigator.pushReplacement(
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
