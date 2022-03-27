import 'package:flutter/material.dart';
import 'package:merrily/component/custombutton.dart';

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
                radius: 60,
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
                height: 52,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 0.5, color: Color(0x33969696)))),
              ),
              Container(
                height: 52,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 0.5, color: Color(0x33969696)))),
              ),
              Container(
                height: 52,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 0.5, color: Color(0x33969696)))),
              ),
              Container(
                height: 52,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 0.5, color: Color(0x33969696)))),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(
                    onPressed: () {},
                    text: 'ออกจากระบบ',
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
