import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class CartoonContent extends StatefulWidget {
  final String chapterName, storyurl;

  const CartoonContent(this.chapterName, this.storyurl);

  @override
  State<CartoonContent> createState() => _CartoonContentState();
}

class _CartoonContentState extends State<CartoonContent> {
  bool _showstack = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: boolTrue ? AppBar() : PreferredSize(preferredSize: Size(0.0, 0.0),child: Container(),),
      body: Stack(children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _showstack == false ? _showstack = true : _showstack = false;
            });
          },
          child: SfPdfViewer.network(
            widget.storyurl,
            canShowScrollStatus: false,
            canShowScrollHead: false,
            pageSpacing: 0,
            enableTextSelection: false,
          ),
        ),
        SafeArea(
            child: Align(
          alignment: Alignment.topLeft,
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ))
      ]),
    );
  }
}
