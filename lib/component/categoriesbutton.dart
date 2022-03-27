import 'package:flutter/material.dart';

class CategoriesButton extends StatefulWidget {
  final String imageName;
  final String name;
  final GestureTapCallback onPressed;

  const CategoriesButton(
      {required this.imageName, required this.name, required this.onPressed});

  @override
  State<CategoriesButton> createState() => _CategoriesButtonState();
}

class _CategoriesButtonState extends State<CategoriesButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 50,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 48,
            width: 48,
            child: ElevatedButton(
                onPressed: widget.onPressed,
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff643ff9),
                  padding: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // <-- Radius
                  ),
                ),
                child: Image.asset(
                  widget.imageName,
                  height: 48,
                  width: 48,
                )),
          ),
          SizedBox(height: 12),
          Text(widget.name,
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Kanit', fontSize: 10))
        ],
      ),
    );
  }
}
