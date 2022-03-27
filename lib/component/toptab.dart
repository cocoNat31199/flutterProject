import 'package:flutter/material.dart';

class Toptab extends StatefulWidget {
  final String tabName;

  const Toptab({required this.tabName});

  @override
  State<Toptab> createState() => _ToptabState();
}

class _ToptabState extends State<Toptab> {
  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 36,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(widget.tabName,
              style: TextStyle(fontFamily: 'Kanit', fontSize: 14)),
        ),
      ),
    );
  }
}
