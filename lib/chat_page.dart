import 'package:flutter/material.dart';

import 'chat_card_2.dart';
import 'custom_feedback.dart';

enum FieldReport {
  Bus,
  Driver,
  Station,
  App,
  Other,
}

class ReportInfoItem {
  FieldReport fieldReport;
  String timeHasPassed;
  String busStopName;
  String reportContent;
  String image;

  ReportInfoItem({
    this.fieldReport,
    this.timeHasPassed,
    this.busStopName,
    this.reportContent,
    this.image,
  });
}

class ChatPage extends StatefulWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<ReportInfoItem> listReportInfo = [
    ReportInfoItem(
      fieldReport: FieldReport.Bus,
      busStopName: "Xe 60",
      reportContent:
          "Xe dơ ghế có nhiều bụi, Xe dơ ghế có nhiều bụi, Xe dơ ghế có nhiều bụi, Xe dơ ghế có nhiều bụi",
      timeHasPassed: "2 giờ trước",
      image:
          "https://vntrip.cdn.vccloud.vn/cam-nang/wp-content/uploads/2017/08/xe-bus.png",
    ),
    ReportInfoItem(
      fieldReport: FieldReport.App,
      busStopName: "Bimos",
      reportContent: "App cùi vl",
      timeHasPassed: "15 phút trước",
    ),
    ReportInfoItem(
      fieldReport: FieldReport.Driver,
      busStopName: "Xe 69",
      reportContent: "Tài xế là racing boy",
      timeHasPassed: "1 giờ trước",
      image:
          "http://cdn.baogiaothong.vn/files/news/2018/08/10/183936-xe-buyt-gay-su.jpg",
    ),
    ReportInfoItem(
      fieldReport: FieldReport.Station,
      busStopName: "Bến xe bus trường skpt",
      reportContent: "Bến xe đông quá.",
      timeHasPassed: "10 ngày trước",
    ),
    ReportInfoItem(
      fieldReport: FieldReport.Other,
      busStopName: "Xe 10",
      reportContent: "Cho em xin số anh đẹp trai bán vé đi.",
      timeHasPassed: "15 giây trước",
    ),
  ];

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
                        // scrollPadding: EdgeInsets.all(0),
                        style: new TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                        decoration: new InputDecoration(
                          fillColor: Colors.white,
                          hintText: 'Tìm kiếm',
                          hintStyle: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                            top: 15.0,
                          ),

                          // prefixIcon: Icon(
                          //   Icons.search,
                          //   color: Colors.white,
                          // ),
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 5, bottom: 70),
                itemCount: listReportInfo.length,
                itemBuilder: (BuildContext context, int index) {
                  return ChatCard(
                    reportInfo: listReportInfo[index],
                  );
                },
              ),
              // ListView(
              //   padding: EdgeInsets.only(top: 5, bottom: 70),
              //   children: <Widget>[
              //     ChatCard(),
              //     ChatCard(),
              //     ChatCard(),
              //     ChatCard(),
              //     ChatCard(),
              //   ],
              // ),
            ),
          ],
        ),
        color: Color.fromRGBO(0, 0, 0, 0.03),
      ),
    );
  }
}
