import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:merrily/component/custombutton.dart';
import 'package:merrily/component/user.dart';
import 'package:merrily/screen/login.dart';

// import '../model/user.dart';

class Register_1 extends StatefulWidget {
  const Register_1({Key? key}) : super(key: key);

  @override
  State<Register_1> createState() => _Register_1State();
}

class _Register_1State extends State<Register_1> {
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
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          title: Text(
            'สมัครสมาชิก',
            style: TextStyle(
                color: Colors.black, fontFamily: 'Kanit', fontSize: 20),
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
            child: RegisForm(),
          ),
        ),
      ),
    );
  }
}

class RegisForm extends StatefulWidget {
  const RegisForm({Key? key}) : super(key: key);

  @override
  State<RegisForm> createState() => _RegisFormState();
}

class _RegisFormState extends State<RegisForm> {
  final formKey = GlobalKey<FormState>();
  UserProfile user = UserProfile();

  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  bool _isVisible = false;

  void updateStatus() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  bool _isVisibleConfirm = false;

  void confirmupdateStatus() {
    setState(() {
      _isVisibleConfirm = !_isVisibleConfirm;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _passwordVisible;
    var _confirmpasswordVisible;
    return Form(
      key: formKey,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 28.0, bottom: 28.0),
            child: TextFormField(
              cursorColor: Color(0xff643ff9),
              onSaved: (String? username) {
                user.username = username;
              },
              validator: RequiredValidator(errorText: "กรุณาป้อนชื่อผู้ใช้"),
              decoration: InputDecoration(
                  labelText: 'Username',
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
            margin: EdgeInsets.only(bottom: 28.0),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              onSaved: (String? email) {
                user.email = email;
              },
              validator: MultiValidator([
                RequiredValidator(errorText: 'กรุณาใส่อีเมล'),
                EmailValidator(errorText: 'รูปแบบอีเมลไม่ถูกต้อง')
              ]),
              cursorColor: Color(0xff643ff9),
              decoration: InputDecoration(
                  labelText: 'E-mail',
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
            margin: EdgeInsets.only(bottom: 28.0),
            child: TextFormField(
              // maxLength: 10;
              onSaved: (String? password) {
                user.password = password;
              },
              controller: _pass,
              validator: (String? pass) {
                if (pass!.isEmpty) return 'กรุณาใส่รหัสผ่าน';
                if (0 != pass.length < 6 ) return 'รหัสผ่านควรมี 6 ตัวขึ้นไป';
                return null;
              },
              cursorColor: Color(0xff643ff9),
              obscureText: _isVisible ? false : true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                  fontFamily: 'Kanit',
                  fontSize: 16,
                ),
                helperText: 'Password Should be 6-10 characters',
                floatingLabelStyle: TextStyle(
                  color: Color(0xff643ff9),
                  fontFamily: 'Kanit',
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff643ff9))),
                suffixIcon: IconButton(
                  onPressed: () => updateStatus(),
                  icon: Icon(
                    _isVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: TextFormField(
              // maxLength: 10,
              onSaved: (String? confirmpassword) {
                user.confirmpassword = confirmpassword;
              },
              controller: _confirmPass,
              validator: (String? confirmPass) {
                if (confirmPass!.isEmpty) return 'กรุณาใส่ยืนยันรหัสผ่าน';
                if (confirmPass != _pass.text) return 'รหัสผ่านไม่ถูกต้อง';
                return null;
              },
              cursorColor: Color(0xff643ff9),
              obscureText: _isVisibleConfirm ? false : true,
              decoration: InputDecoration(
                labelText: 'Confirm password',
                labelStyle: TextStyle(
                  fontFamily: 'Kanit',
                  fontSize: 16,
                ),
                floatingLabelStyle: TextStyle(
                  color: Color(0xff643ff9),
                  fontFamily: 'Kanit',
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff643ff9))),
                suffixIcon: IconButton(
                  onPressed: () => confirmupdateStatus(),
                  icon: Icon(
                    _isVisibleConfirm ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                ),
              ),
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
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      print(
                          '${user.username} ${user.email} ${user.password} ${user.confirmpassword}');
                      formKey.currentState!.reset();
                    }
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Register_2()));
                  },
                  text: 'ต่อไป',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Register_2 extends StatefulWidget {
  const Register_2({Key? key}) : super(key: key);

  @override
  State<Register_2> createState() => _Register_2State();
}

class _Register_2State extends State<Register_2> {
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
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                )),
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
              child: Column(
                children: [
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
                          child: Column(
                            children: [
                              RegisForm_2(),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}

class RegisForm_2 extends StatefulWidget {
  const RegisForm_2({Key? key}) : super(key: key);

  @override
  State<RegisForm_2> createState() => _RegisForm_2State();
}

class _RegisForm_2State extends State<RegisForm_2> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 60.0, bottom: 48),
            child: CircleAvatar(
              radius: 90,
            ),
          ),
          Container(
            child: TextFormField(
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
                      borderSide: BorderSide(color: Color(0xff643ff9))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff643ff9)))),
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
                  onPressed: () {},
                  text: 'ต่อไป',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
