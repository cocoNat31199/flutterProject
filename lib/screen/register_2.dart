import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:merrily/component/custombutton.dart';
import 'package:merrily/component/user.dart';

class RegisForm_2 extends StatefulWidget {
  const RegisForm_2({Key? key}) : super(key: key);

  @override
  State<RegisForm_2> createState() => _RegisForm_2State();
}

class _RegisForm_2State extends State<RegisForm_2> {
  // File? image;
  // PickedFile? _imageFile;
  // final ImagePicker _picker = ImagePicker();
  Usermerrily user = Usermerrily();

  final formKey = GlobalKey<FormState>();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 60.0, bottom: 48),
            // child: image != null
            //     ? Container(width: 180,height: 180,child: GestureDetector(onTap: selectFile,child: ClipOval(child: Image.file(image!,width: 180,height: 180,fit: BoxFit.cover,),)))
            //     : CircleAvatar(
            //         radius: 90,
            //         child: IconButton(
            //           icon: Icon(Icons.add_outlined),
            //           iconSize: 32,
            //           color: Colors.black,
            //           onPressed: selectFile,
            //         ),
            //       ),
          ),
          Container(
            child: TextFormField(
              onSaved: (String? display) {
                user.displayname = display;
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
                  onPressed: () async {},
                  text: 'ต่อไป',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // Future selectFile() async {
  //   final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (image == null) return;

  //   final imageTemporary = File(image.path);
  //   setState(() => this.image = imageTemporary);
  // }

  // Future uploadProfile() async {

  //   Random random = Random();
  //   int i = random.nextInt(100000);

  //   FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  //   Reference reference = firebaseStorage.ref().child('Profile/Image$i.jpg');
  //   UploadTask uploadTask = reference.putFile(image!);
  // }

  // Future findDisplayName() async{
  //   await Firebase.initializeApp().then((value)async {
  //     await FirebaseAuth.instance.authStateChanges().listen((event) {
  //       setState(() {
  //         user.displayname = event!.displayName;
  //         });
  //         print('DisplayName = ${user.displayname}'); //Display = Null ไว้กลับมาแก้ต่อ
  //      });
  //   });
  // }

}
