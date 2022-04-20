import 'package:flutter/material.dart';
import 'package:merrily/component/custombutton.dart';

class Addcoin extends StatefulWidget {
  const Addcoin({Key? key}) : super(key: key);

  @override
  State<Addcoin> createState() => _AddcoinState();
}

class _AddcoinState extends State<Addcoin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: new ThemeData(
            primaryColor: Color(0xff643ff9),
            scaffoldBackgroundColor: const Color(0xff643ff9),
            fontFamily: ('Kanit ')),
        home: Scaffold(
            appBar: AppBar(
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
                'เติมเงิน',
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
                    Container(
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
                    SizedBox(
                      height: 24,
                    ),
                    Text('เลือกช่องทางการเติมเงิน',
                        style: TextStyle(
                            color: Color(0xff969696),
                            fontFamily: 'Kanit',
                            fontSize: 12)),
                    Container(
                      height: 52,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 0.5, color: Color(0x33969696)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/images/truemoney.png'),
                              SizedBox(
                                width: 8,
                              ),
                              Text('เหรียญของคุณ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Kanit',
                                      fontSize: 16)),
                            ],
                          ),
                          // Text('฿ 300',
                          //     style: TextStyle(
                          //         color: Colors.black,
                          //         fontFamily: 'Kanit',
                          //         fontSize: 16)),
                          Radio(
                            value: null,
                            groupValue: null,
                            onChanged: null,
                            activeColor: Color(0xff643ff9),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      child: TextFormField(
                        cursorColor: Color(0xff643ff9),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'กรอกรหัสของคุณ',
                            labelStyle: TextStyle(
                              fontFamily: 'Kanit',
                              fontSize: 16,
                            ),
                            floatingLabelStyle: TextStyle(
                              color: Color(0xff643ff9),
                              fontFamily: 'Kanit',
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff643ff9))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff643ff9)))),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Center(
                      child: Column(
                        children: [
                          CustomButton(onPressed: () {}, text: 'ยืนยัน'),
                          CustomButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              text: 'ยกเลิก'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
