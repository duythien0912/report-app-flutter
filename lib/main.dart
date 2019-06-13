import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'new_feedback.dart';
// import 'package:flutter/services.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //     // systemNavigationBarColor: Colors.blue, // navigation bar color
  //     // statusBarColor: Colors.pink, // status bar color
  //     ));

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        // accentColorBrightness: Brightness.light,
      ),
      home: ChatPage(),
    );
  }
}

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
      persistentFooterButtons: <Widget>[
        ClipOval(
          child: Container(
            color: Colors.red,
            child: IconButton(
              icon: Image.asset(
                "assets/danger.png",
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateFeedback(),
                  ),
                );
              },
            ),
          ),
        ),
        ClipOval(
          child: Container(
            color: Colors.red,
            child: IconButton(
              icon: Image.asset(
                "assets/police.png",
              ),
              onPressed: () {
                launch("tel://21213123123");
              },
            ),
          ),
        ),
        ClipOval(
          child: Container(
            color: Colors.green,
            child: IconButton(
              icon: Icon(Icons.feedback, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomFeedback(),
                  ),
                );
              },
            ),
          ),
        ),
      ],
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.blue,
              child: SafeArea(
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
                            padding: const EdgeInsets.only(bottom: 8.0),
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
                children: <Widget>[
                  ChatCard(),
                ],
              ),
            ),
          ],
        ),
        color: Colors.white,
      ),
    );
  }
}

class CustomFeedback extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // controller: controller,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,

            children: <Widget>[
              BackButton(),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  // vertical: 16,
                ),
                child: Text(
                  "Với chúng tôi, mọi phản hồi đều đáng quý. Theo bạn, chúng tôi nên cải thiện điểm nào?",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12,
                ),
                child: Text("Nếu bạn cần hỗ trợ"),
              ),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: MyThreeOptions(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12,
                ),
                child: TextField(
                  decoration: new InputDecoration(
                    hintText: "Chia sẻ cảm nghĩ của bạn tại đây",
                    hintStyle: TextStyle(
                      fontSize: 14,
                    ),
                    contentPadding: EdgeInsets.all(10),
                    border: new OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12,
                ),
                child: Container(
                  // padding: EdgeInsets.all(8),
                  height: 50,
                  width: double.infinity,
                  child: new FlatButton(
                      color: Color.fromRGBO(
                        43,
                        183,
                        86,
                        1,
                      ),
                      textColor: Colors.white,
                      onPressed: () {},
                      child: new Text(
                        'Gửi phản hồi',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )),
                ),
              ),
              // Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class SupportItem extends StatelessWidget {
  const SupportItem({
    Key key,
    this.item,
  }) : super(key: key);

  final SupItem item;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double widthMinus = width - 56 - 78 - 72;
    double widthMinus = width - 56 - 78 - 25;
    return Container(
      height: widthMinus / 3 + 24,
      width: widthMinus / 3,
      // color: Colors.teal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          item.image.isEmpty
              ? FlutterLogo()
              : Image.asset(
                  item.image,
                  height: widthMinus / 3,
                ),
          Padding(
            padding: EdgeInsets.only(top: 7),
          ),
          Text(
            item.name,
            style: TextStyle(
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}

class SupItem {
  final int index;
  final String name;
  final String image;

  SupItem({this.index, this.name, this.image});
}

class MyThreeOptions extends StatefulWidget {
  @override
  _MyThreeOptionsState createState() => _MyThreeOptionsState();
}

List<SupItem> reportList = [
  SupItem(index: 1, image: "assets/bus.png", name: "Xe"),
  SupItem(index: 2, image: "assets/driver1.png", name: "Tài Xế"),
  SupItem(index: 3, image: "assets/bus_stop1.png", name: "Bến"),
  SupItem(index: 4, image: "assets/app1.png", name: "Ứng dụng"),
  SupItem(index: 5, image: "assets/404.png", name: "Khác"),
];

class _MyThreeOptionsState extends State<MyThreeOptions> {
  List<SupItem> selectedChoices = [];

  // List<int> selectedChoices = List();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 11,
      runSpacing: 11,
      children: List<Widget>.generate(
        reportList.length,
        (int index) {
          return ChoiceChip(
            // avatar: SupportItem(),

            clipBehavior: Clip.none,
            // padding: EdgeInsets.all(0),
            shape: ShapeBorder.lerp(
                RoundedRectangleBorder(
                  side: BorderSide(
                    color: selectedChoices.contains(reportList[index])
                        ? Color(0xFF00800d)
                        : Colors.transparent,
                    width: 1.5,
                  ),
                  // side: const BorderSide(width: 1.0),
                  borderRadius: BorderRadius.circular(
                    8.0,
                  ),
                ),
                RoundedRectangleBorder(
                  side: BorderSide(
                    color: selectedChoices.contains(reportList[index])
                        ? Color(0xFF00800d)
                        : Colors.transparent,
                    width: 1,
                  ),
                  // side: const BorderSide(width: 1.0),
                  borderRadius: BorderRadius.circular(
                    8.0,
                  ),
                ),
                0.0),
            backgroundColor: Colors.grey[200],
            shadowColor: Colors.transparent,
            selectedShadowColor: Colors.transparent,
            padding: EdgeInsets.all(8),
            selectedColor: Colors.grey[200],
            label: SupportItem(item: reportList[index]),
            selected: selectedChoices.contains(reportList[index]),
            onSelected: (bool selected) {
              // setState(() {
              //   _value = selected ? index : null;
              // });
              selectedChoices.contains(reportList[index])
                  ? selectedChoices.remove(reportList[index])
                  : selectedChoices.add(reportList[index]);
              setState(() {
                selectedChoices = selectedChoices;
              });

              print(selectedChoices);
            },
          );
        },
      ).toList(),
    );
  }
}

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Container(
        padding: new EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FlutterLogo(
              size: 35,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text('Background',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    )),
                new Text(DateTime.now().toString())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
