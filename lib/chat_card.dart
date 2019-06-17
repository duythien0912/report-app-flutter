import 'package:flutter/material.dart';

import 'page/message_page.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // DateTime now = new DateTime.now();
    // DateTime date = new DateTime(now.year, now.month, now.day);
    double c_width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MessagePage(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: 10,
        ),
        height: 135,
        child: Stack(
          children: <Widget>[
            new Card(
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
                  border: Border(
                    bottom: BorderSide(
                      width: 2.0,
                      color: Colors.blue,
                    ),
                  ),
                ),
                padding: new EdgeInsets.only(
                  top: 12.0,
                  bottom: 12,
                  left: 6,
                  right: 0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    ClipOval(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: new BoxDecoration(
                          color: Colors.black12,
                          image: DecorationImage(
                            image: AssetImage("assets/holder.png"),
                          ),
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
                            //     Image.asset(
                            //   "assets/holder.png",
                            //   height: 35,
                            //   fit: BoxFit.contain,
                            // ),
                            SizedBox(
                          height: 35,
                          width: 35,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                    ),
                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new CategoryText(),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                            ),
                            new TimeText(),
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
                              "Bến số 11",
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
                          width: c_width - 111,
                          height: 45,
                          child: new Text(
                            "Xe dơ có bụi ngay ghế, Xe dơ có bụi ngay ghế, Xe dơ có bụi ngay ghế, Xe dơ có bụi ngay ghế, Xe dơ có bụi ngay ghế, Xe dơ có bụi ngay ghế, Xe dơ có bụi ngay ghế, ",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment(1.1, 1.6),
              child: ClipOval(
                child: Container(
                  height: 55,
                  width: 55,
                  color: Color.fromRGBO(243, 243, 243, 1),
                ),
              ),
            ),
            Container(
              alignment: Alignment(0.98, 1.25),
              child: ClipOval(
                child: Container(
                  height: 55,
                  width: 55,
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Đang xử lý",
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryText extends StatelessWidget {
  const CategoryText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 5),
          // height: 20,
          width: 20,
          child: Image.asset(
            "assets/bus.png",
            fit: BoxFit.cover,
          ),
        ),
        new Text('Xe bus dơ',
            style: TextStyle(
              // fontSize: 14,
              fontWeight: FontWeight.w600,
            )),
      ],
    );
  }
}

class TimeText extends StatelessWidget {
  const TimeText({
    Key key,
  }) : super(key: key);

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
        Text("2 giờ trước",
            style: TextStyle(
              // fontSize: 12,
              fontWeight: FontWeight.w600,
            )),
      ],
    );
  }
}
