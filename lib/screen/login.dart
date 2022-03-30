import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:merrily/component/custombutton.dart';
import 'package:merrily/component/user.dart';
import 'package:merrily/main.dart';
import 'package:merrily/screen/register_1.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error'),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              body: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0),
                              )),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/logo.png'),
                                Inputform()
                              ],
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 56,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don’t I have an account?',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Kanit',
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register_1()));
                            },
                            child: Text(
                              "create",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Kanit',
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}

class Inputform extends StatefulWidget {
  const Inputform({Key? key}) : super(key: key);

  @override
  State<Inputform> createState() => _InputformState();
}

class _InputformState extends State<Inputform> {
  UserProfile user = UserProfile();
  final formKey = GlobalKey<FormState>();

  bool _isVisible = false;

  void updateStatus() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _passwordVisible;
    return Container(
        margin: EdgeInsets.only(top: 28),
        child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 28.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (String? email) {
                      user.email = email;
                    },
                    validator: MultiValidator([
                      RequiredValidator(errorText: "กรุณาป้อนชื่อผู้ใช้"),
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
                    keyboardType: TextInputType.text,
                    onSaved: (String? password) {
                      user.password = password;
                    },
                    validator:
                        RequiredValidator(errorText: 'กรุณาป้อนรหัสผ่าน'),
                    cursorColor: Color(0xff643ff9),
                    obscureText: _isVisible ? false : true,
                    decoration: InputDecoration(
                      labelText: 'Password',
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
                        onPressed: () => updateStatus(),
                        icon: Icon(
                          _isVisible ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    height: 36,
                    width: double.infinity,
                    child: CustomButton(
                        onPressed: (() async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            try {
                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: user.email!,
                                      password: user.password!)
                                  .then((value) {
                                Fluttertoast.showToast(
                                    msg: 'เข้าสู่ระบบสำเร็จ',
                                    gravity: ToastGravity.BOTTOM);
                                formKey.currentState!.reset();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyApp()));
                              });
                            } on FirebaseAuthException catch (e) {
                              Fluttertoast.showToast(
                                  msg: e.message!,
                                  gravity: ToastGravity.BOTTOM);
                            }
                          }
                        }),
                        text: 'เข้าสู่ระบบ')),
                Container(
                    margin: EdgeInsets.only(top: 24),
                    child: Text(
                      'or',
                      style: TextStyle(
                          color: Color(0x6e000000),
                          fontFamily: 'Kanit',
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            )));
  }
}
