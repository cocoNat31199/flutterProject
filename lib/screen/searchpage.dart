import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 56),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0))),
        child: SafeArea(
          child: Column(children: [
            CustomSearchBar(),
          ]),
        ),
      ),
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Flexible(
            child: Container(
                height: 48.0,
                width: double.infinity,
                child: Center(
                  child: TextField(
                    textAlignVertical: TextAlignVertical.bottom,
                    style: TextStyle(
                        color: Colors.black, fontFamily: 'Kanit', fontSize: 16),
                    cursorColor: Color(0xff643ff9),
                    decoration: InputDecoration(
                        hintText: 'ค้นหา',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff643ff9)),
                            borderRadius: BorderRadius.circular(50)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff643ff9)),
                            borderRadius: BorderRadius.circular(50)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff643ff9)),
                            borderRadius: BorderRadius.circular(50))),
                  ),
                )),
          ),
          Align(
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(0)),
                ),
                child: Text(
                  'ยกเลิก',
                  style: TextStyle(
                      color: Colors.black, fontFamily: 'Kanit', fontSize: 16),
                )),
          )
        ],
      ),
    );
  }
}
