import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
                            'คุณมีแอคเคาท์หรือยัง?',
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
                              "สร้างเลย",
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
  Usermerrily user = Usermerrily();
  final formKey = GlobalKey<FormState>();
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isVisible = false;

  void updateStatus() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth!.idToken, accessToken: googleAuth.accessToken);
    UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    return userCredential.user;
  }

  Future signWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance
          .login(permissions: (['email', 'public_profile']));
      final token = result.accessToken!.token;
      try {
        final AuthCredential facebookCredential =
            FacebookAuthProvider.credential(result.accessToken!.token);
        final userCredential = await FirebaseAuth.instance
            .signInWithCredential(facebookCredential);
      } catch (e) {}
    } catch (e) {}
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
                    keyboardType: TextInputType.text,
                    onSaved: (String? password) {
                      user.password = password;
                    },
                    validator:
                        RequiredValidator(errorText: 'กรุณาป้อนรหัสผ่าน'),
                    cursorColor: Color(0xff643ff9),
                    obscureText: _isVisible ? false : true,
                    style: TextStyle(fontFamily: 'Kanit'),
                    decoration: InputDecoration(
                      labelText: 'รหัสผ่าน',
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
                                Navigator.pushAndRemoveUntil<void>(
                                  context,
                                  MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          MyApp()),
                                  ModalRoute.withName('./home.dart'),
                                );
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
                    margin: EdgeInsets.only(top: 24, bottom: 12),
                    child: Text(
                      'หรือ',
                      style: TextStyle(
                          color: Color(0x6e000000),
                          fontFamily: 'Kanit',
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    )),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  IconButton(
                    onPressed: () {
                      signWithFacebook().then((value) {
                        FacebookAuth.instance.getUserData().then((userData) {
                          uploadFirestore();
                          Fluttertoast.showToast(
                              msg: 'เข้าสู่ระบบสำเร็จ',
                              gravity: ToastGravity.BOTTOM);
                          Navigator.pushAndRemoveUntil<void>(
                            context,
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) => MyApp()),
                            ModalRoute.withName('./home.dart'),
                          );
                        });
                      });
                    },
                    icon: Image.asset('assets/images/icon_facebook.png'),
                    padding: EdgeInsets.all(0),
                  ),
                  IconButton(
                    onPressed: () {
                      signInWithGoogle().then((value) {
                        uploadFirestore();
                        Fluttertoast.showToast(
                            msg: 'เข้าสู่ระบบสำเร็จ',
                            gravity: ToastGravity.BOTTOM);
                        Navigator.pushAndRemoveUntil<void>(
                          context,
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) => MyApp()),
                          ModalRoute.withName('./home.dart'),
                        );
                      });
                    },
                    icon: Image.asset('assets/images/icon_google.png'),
                    padding: EdgeInsets.all(0),
                  ),
                ])
              ],
            )));
  }

  Future<void> uploadFirestore() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    Map<String, dynamic> map = Map();
    map['UID'] = _auth.currentUser!.uid;
    map['profilepic'] = _auth.currentUser!.photoURL;
    map['displayname'] = _auth.currentUser!.displayName;

    //Insert Data To Firestore
    firestore
        .collection('Userprofile')
        .doc(_auth.currentUser!.uid)
        .set(map, SetOptions(merge: true));
  }
}
