import 'package:flutter/material.dart';

import '../feedback_page.dart';

class FeedbackItemChat extends StatefulWidget {
  const FeedbackItemChat({
    Key key,
    this.reportInfo,
  }) : super(key: key);

  final ReportInfoItem reportInfo;

  @override
  _FeedbackItemChatState createState() => _FeedbackItemChatState();
}

class _FeedbackItemChatState extends State<FeedbackItemChat> {
  bool isShowFull = false;

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
    double deviceWidth = MediaQuery.of(context).size.width;

    double triSize = 30;

    Color colorReport = getColorReport(
      widget.reportInfo.processingStatus,
      'color',
    );

    String statusReport = getColorReport(
      widget.reportInfo.processingStatus,
      'text',
    );

    return GestureDetector(
      onTap: () {
        setState(() {
          isShowFull = !isShowFull;
        });
      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: 0,
        ),
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: new Card(
                child: Column(
                  children: <Widget>[
                    new Container(
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        boxShadow: [],
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
                              height: 60,
                              width: 60,
                              decoration: new BoxDecoration(
                                color: Colors.black12,
                              ),
                              child: widget.reportInfo.image == null
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
                                      image: widget.reportInfo.image,
                                    ),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          new CategoryText(
                                            fieldReport:
                                                widget.reportInfo.fieldReport,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 10),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                Icons.location_on,
                                                size: 20,
                                                color: Colors.red,
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 3),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  widget.reportInfo.busStopName,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(right: 25),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          TimeText(
                                              timeHasPassed: widget
                                                  .reportInfo.timeHasPassed),
                                          Padding(
                                            padding: EdgeInsets.only(top: 10),
                                          ),
                                          StatusText(
                                              statusReport: statusReport,
                                              colorReport: colorReport),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                ),
                                Container(
                                  width: deviceWidth - 111,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        child: new Text(
                                          widget.reportInfo.reportContent,
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                          maxLines: isShowFull ? 99 : 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Icon(
                                        isShowFull
                                            ? Icons.keyboard_arrow_up
                                            : Icons.keyboard_arrow_down,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Container(
                        height: 2,
                        width: double.infinity,
                        color: colorReport,
                      ),
                    ),
                  ],
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
                fontWeight: FontWeight.w600,
              ),
            );
        }
        break;

      case FieldReport.App:
        {
          if (type == 'image')
            return Padding(
              padding: const EdgeInsets.only(
                left: 4.0,
                right: 4,
              ),
              child: Image.asset(
                "assets/app1.png",
                fit: BoxFit.cover,
              ),
            );
          if (type == 'text')
            return Text(
              'Ứng dụng',
              style: TextStyle(
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
          // margin: EdgeInsets.only(right: 5),
          height: 20,
          child: Center(
            child: selectImage("image"),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 3),
        ),
        Expanded(
          child: selectImage('text'),
        ),
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
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class StatusText extends StatelessWidget {
  const StatusText({
    Key key,
    this.statusReport,
    this.colorReport,
  }) : super(key: key);

  final Color colorReport;
  final String statusReport;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 2, right: 2),
          child: ClipOval(
            child: Container(
              color: colorReport,
              height: 16,
              width: 16,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 5),
        ),
        Text(
          statusReport,
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
