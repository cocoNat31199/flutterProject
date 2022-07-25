import 'package:flutter/material.dart';

class CoverCartoon extends StatefulWidget {
  const CoverCartoon({Key? key}) : super(key: key);

  @override
  State<CoverCartoon> createState() => _CoverCartoonState();
}

class _CoverCartoonState extends State<CoverCartoon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 156,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),),
    );
  }
}
