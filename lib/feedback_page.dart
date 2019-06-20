import 'package:flutter/material.dart';

import 'custom_feedback.dart';
import 'feedback_item.dart';

enum FieldReport {
  Bus,
  Driver,
  Station,
  App,
  Other,
}

enum ProcessingStatus {
  Processing,
  Finished,
  SpamReport,
}

class ReportInfoItem {
  ReportInfoItem({
    this.fieldReport,
    this.timeHasPassed,
    this.busStopName,
    this.reportContent,
    this.image,
    this.processingStatus,
  });

  String busStopName;
  FieldReport fieldReport;
  String image;
  ProcessingStatus processingStatus;
  String reportContent;
  String timeHasPassed;
}

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({
    Key key,
    this.hasDrawer = false,
  }) : super(key: key);

  final bool hasDrawer;

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  int currentPage = 0;
  List<ReportInfoItem> listReportInfo = [
    ReportInfoItem(
      fieldReport: FieldReport.Bus,
      busStopName: "Xe 60",
      reportContent:
          "Xe dơ ghế có nhiều bụi, Xe dơ ghế có nhiều bụi, Xe dơ ghế có nhiều bụi, Xe dơ ghế có nhiều bụi",
      timeHasPassed: "2 giờ trước",
      image:
          "https://vntrip.cdn.vccloud.vn/cam-nang/wp-content/uploads/2017/08/xe-bus.png",
      processingStatus: ProcessingStatus.Processing,
    ),
    ReportInfoItem(
      fieldReport: FieldReport.App,
      busStopName: "Bimos",
      reportContent: "App cùi vl",
      timeHasPassed: "15 phút trước",
      processingStatus: ProcessingStatus.SpamReport,
    ),
    ReportInfoItem(
      fieldReport: FieldReport.Driver,
      busStopName: "Xe 69",
      reportContent: "Tài xế là racing boy",
      timeHasPassed: "1 giờ trước",
      image:
          "http://cdn.baogiaothong.vn/files/news/2018/08/10/183936-xe-buyt-gay-su.jpg",
      processingStatus: ProcessingStatus.Finished,
    ),
    ReportInfoItem(
      fieldReport: FieldReport.Station,
      busStopName: "Bến xe bus trường skpt",
      reportContent: "Bến xe đông quá.",
      timeHasPassed: "10 ngày trước",
      processingStatus: ProcessingStatus.SpamReport,
    ),
    ReportInfoItem(
      fieldReport: FieldReport.Other,
      busStopName: "Xe 10",
      reportContent: "Cho em xin số anh đẹp trai bán vé đi.",
      timeHasPassed: "15 giây trước",
    ),
  ];

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

      bottomNavigationBar: Container(
        child: Center(child: Text("Alo alo đây là thông báo")),
        color: Color.fromRGBO(200, 200, 200, 1),
        height: 45,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CustomFeedback(),
            ),
          );
        },
        child: Icon(Icons.speaker_notes),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

      // floatingActionButton: Container(
      //   // width: 200.0,
      //   decoration: BoxDecoration(
      //     color: Colors.blue,
      //     borderRadius: BorderRadius.circular(
      //       12.0,
      //     ),
      //   ),
      //   // height: 200.0,
      //   child: RawMaterialButton(
      //     shape: new CircleBorder(),
      //     elevation: 0.0,
      //     onPressed: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => CustomFeedback(),
      //         ),
      //       );
      //     },
      //     child: IntrinsicWidth(
      //       child: Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      //         child: Row(
      //           children: <Widget>[
      //             Icon(
      //               Icons.speaker_notes,
      //               color: Colors.white,
      //               size: 25,
      //             ),
      //             Padding(
      //               padding: EdgeInsets.only(left: 10),
      //             ),
      //             Text(
      //               "Gửi phản ánh mới",
      //               style: TextStyle(
      //                 fontSize: 16,
      //                 fontWeight: FontWeight.w500,
      //                 color: Colors.white,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
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
                    widget.hasDrawer
                        ? BackButton(
                            color: Colors.white,
                          )
                        : SizedBox(
                            height: 24,
                            width: 24,
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
                  return FeedbackItem(
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
