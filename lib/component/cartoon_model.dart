import 'package:flutter/material.dart';

class CartoonModel extends StatelessWidget {
  final GestureTapCallback? onPressed;
  final String? src;

  const CartoonModel({this.onPressed, this.src});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 176,
      width: 100,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: GestureDetector(
          onTap: onPressed,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              src!,
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}
