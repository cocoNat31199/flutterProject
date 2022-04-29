import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:merrily/screen/cartoonCantent.dart';

class CartoonPage extends StatefulWidget {
  final String cartoonName, detail, urlCover, urlCartoon;

  const CartoonPage(
      this.cartoonName, this.detail, this.urlCover, this.urlCartoon);

  @override
  State<CartoonPage> createState() => _CartoonPageState();
}

class _CartoonPageState extends State<CartoonPage> {
  bool _isFav = false;
  bool _isFollow = false;

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
                  bottomRight: Radius.circular(20.0),
                )),
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Cartoon')
                  .where('Name', isEqualTo: widget.cartoonName)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Column(
                  children: [
                    Column(children: [
                      Stack(children: [
                        Container(
                          height: 180,
                          width: double.infinity,
                          child: ClipRRect(
                            child: Image.network(
                              widget.urlCover,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SafeArea(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.black,
                                  )),
                              // IconButton(onPressed: () {}, icon: icon)
                              _isFav == false
                                  ? IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _isFav = true;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.favorite_border_outlined,
                                        color: Colors.black,
                                        size: 28,
                                      ),
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _isFav = false;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.favorite_outlined,
                                        color: Colors.red,
                                      )),
                            ],
                          ),
                        )
                      ]),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                    height: 100,
                                    width: 100,
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        color: Color(0xff969696),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        widget.urlCartoon,
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                                Column(
                                  children: [
                                    Text(
                                      widget.cartoonName,
                                      style: TextStyle(
                                          fontFamily: 'Kanit',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Align(
                              child: SizedBox(
                                height: 24,
                                child: _isFollow == false
                                    ? ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            _isFollow = true;
                                          });
                                        },
                                        child: Text('ติดตาม'),
                                        style: ElevatedButton.styleFrom(
                                            primary: Color(0xff643ff9),
                                            textStyle: TextStyle(
                                                fontFamily: 'Kanit',
                                                fontSize: 16,
                                                color: Colors.white)))
                                    : OutlinedButton(
                                        onPressed: () {
                                          setState(() {
                                            _isFollow = false;
                                          });
                                        },
                                        child: Text("เลิกติดตาม",
                                            style: TextStyle(
                                                fontFamily: 'Kanit',
                                                fontSize: 16,
                                                color: Color(0xff643ff9))),
                                        style: OutlinedButton.styleFrom(
                                          side: BorderSide(
                                              width: 1.0,
                                              color: Color(0xff643ff9)),
                                        )),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ]),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'เนื้อเรื่องย่อ',
                                  style: TextStyle(
                                      fontFamily: 'Kanit',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                )),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  widget.detail,
                                  style: TextStyle(
                                      fontFamily: 'Kanit', fontSize: 14),
                                )),
                            StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('Cartoon')
                                    .doc(widget.cartoonName)
                                    .collection('Chapter')
                                    .snapshots(),
                                builder: (context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (!snapshot.hasData) {
                                    return CircularProgressIndicator();
                                  }
                                  return ListView(
                                    physics: NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.only(bottom: 28),
                                    shrinkWrap: true,
                                    children: snapshot.data!.docs.map((doc) {
                                      return Card(
                                        color: Color(0xff643ff9),
                                        child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          CartoonContent(
                                                            doc['Chaptername'],
                                                              doc['Storyurl'])));
                                            },
                                            child: SizedBox(
                                                height: 72,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        AspectRatio(
                                                          aspectRatio: 1,
                                                          child: Image.network(
                                                            doc['Chapterurl'],
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        SizedBox(width: 12),
                                                        Center(
                                                          child: Text(
                                                              doc['Chaptername'],
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontFamily:
                                                                    'Kanit',
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Center(
                                                          child: Text(
                                                              'Ep. ${doc['ChapterNum']}',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontFamily:
                                                                    'Kanit',
                                                              )),
                                                        ),
                                                        SizedBox(
                                                          width: 16,
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ))),
                                      );
                                    }).toList(),
                                  );
                                }),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            )));
  }
}
