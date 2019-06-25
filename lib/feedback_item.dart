import 'package:flutter/material.dart';

import 'feedback_page.dart';
import 'page/message_page.dart';

class FeedbackItem extends StatelessWidget {
  const FeedbackItem({
    Key key,
    this.reportInfo,
  }) : super(key: key);

  final ReportInfoItem reportInfo;

  getColorReport(ProcessingStatus processingStatus, String type) {
    print(processingStatus);
    switch (processingStatus) {
      case ProcessingStatus.Processing:
        if (type == 'color') return Colors.blue;
        if (type == 'text') return 'Đang xử lý';
        break;
      case ProcessingStatus.Finished:
        if (type == 'color') return Colors.green;
        if (type == 'text') return 'Hoàn thành';

        break;
      case ProcessingStatus.SpamReport:
        if (type == 'color') return Colors.blueGrey;
        if (type == 'text') return 'Báo cáo ảo';

        break;
      default:
        if (type == 'color') return Colors.orange;
        if (type == 'text') return 'Khác';

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // DateTime now = new DateTime.now();
    // DateTime date = new DateTime(now.year, now.month, now.day);
    double deviceWidth = MediaQuery.of(context).size.width;

    double triSize = 30;

    Color colorReport = getColorReport(
      reportInfo.processingStatus,
      'color',
    );

    String statusReport = getColorReport(
      reportInfo.processingStatus,
      'text',
    );

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MessagePage(
                  reportInfo: reportInfo,
                ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: 0,
        ),
        height: 110,
        child: Stack(
          // fit: StackFit.passthrough,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: new Card(
                // borderOnForeground: true,
                child: new Container(
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      // new BoxShadow(
                      //   blurRadius: 3.0,
                      //   offset: new Offset(0.0, 3.0),
                      //   spreadRadius: 0.5,
                      //   color: Colors.black12,
                      // ),
                    ],
                    // border: Border(
                    //   bottom: BorderSide(
                    //     width: 2.0,
                    //     color: colorReport,
                    //   ),
                    // ),
                  ),
                  padding: new EdgeInsets.only(
                    top: 12.0,
                    bottom: 12,
                    left: 10,
                    right: 0,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      ClipOval(
                        child: Container(
                          height: deviceWidth / 5,
                          width: deviceWidth / 5,
                          // padding: EdgeInsets.all(8),
                          decoration: new BoxDecoration(
                            color: Colors.black12,
                            // image: DecorationImage(
                            //   fit: BoxFit.fitHeight,
                            //   image: reportInfo.image == null
                            //       ? AssetImage("assets/holder.png")
                            //       : NetworkImage(
                            //           reportInfo.image,
                            //         ),
                            // ),
                            // boxShadow: [
                            //   new BoxShadow(
                            //     // offset: Offset(1, 3),
                            //     spreadRadius: 1,
                            //     color: Colors.black12,
                            //     blurRadius: 3.0,
                            //   ),
                            // ],
                          ),
                          child:
                              // FlutterLogo(
                              //   size: 35,
                              // ),
                              reportInfo.image == null
                                  ? Image.asset(
                                      "assets/holder.png",
                                      height: deviceWidth / 5,
                                      width: deviceWidth / 5,
                                      fit: BoxFit.fitHeight,
                                    )
                                  : FadeInImage.assetNetwork(
                                      height: deviceWidth / 5,
                                      width: deviceWidth / 5,
                                      fit: BoxFit.fitHeight,
                                      placeholder: 'assets/holder.png',
                                      image: reportInfo.image,
                                    ),
                          //     SizedBox(
                          //   height: 50,
                          //   width: 50,
                          // ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                new CategoryText(
                                  fieldReport: reportInfo.fieldReport,
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 25),
                                  child: TimeText(
                                      timeHasPassed: reportInfo.timeHasPassed),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.location_on,
                                  size: 20,
                                  color: Colors.red,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                ),
                                Text(
                                  reportInfo.busStopName,
                                  style: TextStyle(
                                    // fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                            ),
                            Container(
                              padding: const EdgeInsets.only(right: 12.0),
                              width: deviceWidth - 111,
                              // height: 45,
                              child: new Text(
                                reportInfo.reportContent,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                alignment: Alignment(1, 1),
                child: Container(
                  height: triSize,
                  width: triSize,
                  color: colorReport,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Container(
                alignment: Alignment(1, 1),
                child: ClipPath(
                  clipBehavior: Clip.hardEdge,
                  clipper: TriangleClipper(),
                  child: Container(
                    height: triSize,
                    width: triSize,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            new HorizontalTextBar(
                colorReport: colorReport, statusReport: statusReport),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                alignment: Alignment(-1, 1),
                child: Container(
                  height: 2,
                  width: double.infinity,
                  color: colorReport,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HorizontalTextBar extends StatelessWidget {
  const HorizontalTextBar({
    Key key,
    this.colorReport,
    this.statusReport,
  }) : super(key: key);

  final Color colorReport;
  final String statusReport;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        alignment: Alignment(1, -1),
        child: Container(
          padding: EdgeInsets.only(right: 2.5),
          height: double.infinity,
          width: 20,
          color: colorReport,
          child: RotatedBox(
            quarterTurns: 1,
            child: Text(
              statusReport,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.height, 0);
    path.lineTo(0, size.width);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}

class CategoryText extends StatelessWidget {
  const CategoryText({
    Key key,
    this.fieldReport,
  }) : super(key: key);

  final FieldReport fieldReport;

  selectImage(type) {
    switch (fieldReport) {
      case FieldReport.Bus:
        {
          if (type == 'image')
            return Image.asset(
              "assets/bus.png",
              fit: BoxFit.cover,
            );
          if (type == 'text')
            return Text(
              'Xe bus',
              style: TextStyle(
                // fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            );
        }
        break;

      case FieldReport.App:
        {
          if (type == 'image')
            return Image.asset(
              "assets/app1.png",
              fit: BoxFit.cover,
            );
          if (type == 'text')
            return Text(
              'Ứng dụng',
              style: TextStyle(
                // fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            );
        }
        break;

      case FieldReport.Driver:
        {
          if (type == 'image')
            return Image.asset(
              "assets/driver1.png",
              fit: BoxFit.cover,
            );
          if (type == 'text')
            return Text(
              'Tài xế',
              style: TextStyle(
                // fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            );
        }
        break;

      case FieldReport.Station:
        {
          if (type == 'image')
            return Image.asset(
              "assets/bus_stop1.png",
              fit: BoxFit.cover,
            );
          if (type == 'text')
            return Text(
              'Bến xe',
              style: TextStyle(
                // fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            );
        }
        break;

      case FieldReport.Other:
        {
          if (type == 'image')
            return Image.asset(
              "assets/404.png",
              fit: BoxFit.cover,
            );
          if (type == 'text')
            return Text(
              'Khác',
              style: TextStyle(
                // fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            );
        }
        break;
      default:
        {
          return Container();
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 5),
          // height: 20,
          height: 20,
          child: selectImage("image"),
        ),
        selectImage('text'),
      ],
    );
  }
}

class TimeText extends StatelessWidget {
  const TimeText({
    Key key,
    this.timeHasPassed,
  }) : super(key: key);

  final String timeHasPassed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.access_time,
          size: 20,
          color: Colors.blue,
        ),
        Padding(
          padding: EdgeInsets.only(left: 5),
        ),
        Text(
          timeHasPassed,
          style: TextStyle(
            // fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
