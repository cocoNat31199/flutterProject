import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final GestureTapCallback onPressed;
  final String text;

  const CustomButton({required this.onPressed, required this.text});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: widget.onPressed,
        child: Text(widget.text),
        style: ElevatedButton.styleFrom(
            primary: Color(0xff643ff9),
            textStyle: TextStyle(
                fontFamily: 'Kanit', fontSize: 18, color: Colors.white)));
  }
}
