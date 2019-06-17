import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'chat_card.dart';
import 'custom_feedback.dart';
import 'new_feedback.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // persistentFooterButtons: <Widget>[
      //   ClipOval(
      //     child: Container(
      //       color: Colors.red,
      //       child: IconButton(
      //         icon: Image.asset(
      //           "assets/danger.png",
      //         ),
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => CreateFeedback(),
      //             ),
      //           );
      //         },
      //       ),
      //     ),
      //   ),
      //   ClipOval(
      //     child: Container(
      //       color: Colors.red,
      //       child: IconButton(
      //         icon: Image.asset(
      //           "assets/police.png",
      //         ),
      //         onPressed: () {
      //           launch("tel://84981722293");
      //         },
      //       ),
      //     ),
      //   ),
      // ],
      floatingActionButton: Container(
        // width: 200.0,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(
            12.0,
          ),
        ),
        // height: 200.0,
        child: RawMaterialButton(
          shape: new CircleBorder(),
          elevation: 0.0,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CustomFeedback(),
              ),
            );
          },
          child: IntrinsicWidth(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.speaker_notes,
                    color: Colors.white,
                    size: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                  ),
                  Text(
                    "Gửi phản ánh mới",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.blue,
              child: SafeArea(
                bottom: false,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    BackButton(
                      color: Colors.white,
                    ),
                    Expanded(
                      child: TextField(
                        style:
                            new TextStyle(fontSize: 16.0, color: Colors.white),
                        decoration: new InputDecoration(
                          fillColor: Colors.white,
                          hintText: 'Tìm kiếm',
                          hintStyle: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                          border: InputBorder.none,
                          // prefixIcon: Icon(
                          //   Icons.search,
                          //   color: Colors.white,
                          // ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(bottom: 0.0),
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(top: 5, bottom: 70),
                children: <Widget>[
                  ChatCard(),
                  ChatCard(),
                  ChatCard(),
                  ChatCard(),
                  ChatCard(),
                ],
              ),
            ),
          ],
        ),
        color: Color.fromRGBO(0, 0, 0, 0.03),
      ),
    );
  }
}
