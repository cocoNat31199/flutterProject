import 'dart:io';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:merrily/component/custombutton.dart';
import 'package:merrily/component/user.dart';
import 'package:merrily/screen/register_2.dart';

class Register_1 extends StatefulWidget {
  const Register_1({Key? key}) : super(key: key);

  @override
  State<Register_1> createState() => _Register_1State();
}

class _Register_1State extends State<Register_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          style:
              TextStyle(color: Colors.black, fontFamily: 'Kanit', fontSize: 20),
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
    );
  }
}

class RegisForm extends StatefulWidget {
  const RegisForm({Key? key}) : super(key: key);

  @override
  State<RegisForm> createState() => _RegisFormState();
}

class _RegisFormState extends State<RegisForm> {
  Usermerrily user = Usermerrily();

  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  final auth = FirebaseAuth.instance;

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
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error'),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 28.0, bottom: 28.0),
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
                    style: TextStyle(fontFamily: 'Kanit'),
                    decoration: InputDecoration(
                        labelText: 'อีเมล',
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
                      if (0 < pass.length && pass.length < 6)
                        return 'รหัสผ่านควรมี 6 ตัวขึ้นไป';
                      return null;
                    },
                    cursorColor: Color(0xff643ff9),
                    obscureText: _isVisible ? false : true,

                    style: TextStyle(fontFamily: 'Kanit'),
                    decoration: InputDecoration(
                      labelText: 'รหัสผ่าน',
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

                    style: TextStyle(fontFamily: 'Kanit'),
                    validator: (String? confirmPass) {
                      if (confirmPass!.isEmpty) return 'กรุณาใส่ยืนยันรหัสผ่าน';
                      if (confirmPass != _pass.text)
                        return 'รหัสผ่านไม่ถูกต้อง';
                      return null;
                    },
                    cursorColor: Color(0xff643ff9),
                    obscureText: _isVisibleConfirm ? false : true,
                    decoration: InputDecoration(
                      labelText: 'ยืนยันรหัสผ่าน',
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
                          _isVisibleConfirm
                              ? Icons.visibility
                              : Icons.visibility_off,
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
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            try {
                              await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: user.email!,
                                      password: user.password!)
                                  .then((value) {
                                Fluttertoast.showToast(
                                    msg: 'สร้างบัญชีผู้ใช้เรียบร้อย',
                                    gravity: ToastGravity.BOTTOM);
                                formKey.currentState!.reset();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Register_2(auth.currentUser!.uid)));
                              });
                            } on FirebaseAuthException catch (e) {
                              // print(e.code);
                              // print(e.message);
                              String? message;
                              if (e.code == 'email-already-in-use') {
                                message = 'อีเมลนี้ถูกใช้งานแล้ว';
                              } else {
                                message = e.message;
                              }
                              Fluttertoast.showToast(
                                  msg: message!, gravity: ToastGravity.BOTTOM);
                            }
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
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
