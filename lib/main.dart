import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

import 'new_feedback.dart';
// import 'package:flutter/services.dart';

class MainModel with ChangeNotifier {
  List<File> _listImage = [];
  List<File> get listImage => _listImage;

  void pushToListImage(File newFile) {
    _listImage.add(newFile);
    notifyListeners();
  }
}

void main() {
  Provider.debugCheckInvalidValueType = null;

  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //     // systemNavigationBarColor: Colors.blue, // navigation bar color
  //     // statusBarColor: Colors.pink, // status bar color
  //     ));

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => MainModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
          // accentColorBrightness: Brightness.light,
        ),
        home: ChatPage(),
      ),
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
                launch("tel://84981722293");
              },
            ),
          ),
        ),
      ],
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
                    "Gửi đánh giá mới",
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
              // Padding(
              //   padding: const EdgeInsets.symmetric(
              //     horizontal: 16.0,
              //     // vertical: 16,
              //   ),
              //   child: Text(
              //     "Với chúng tôi, mọi phản hồi đều đáng quý. Theo bạn, chúng tôi nên cải thiện điểm nào?",
              //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 6,
                ),
                child: new PickImageRow(),
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
                  vertical: 6,
                ),
                child: TextField(
                  decoration: new InputDecoration(
                    hintText: "Chia sẻ cảm nghĩ của bạn t�����i đây",
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
                  vertical: 6,
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

class PickImageRow extends StatefulWidget {
  const PickImageRow({
    Key key,
  }) : super(key: key);

  @override
  _PickImageRowState createState() => _PickImageRowState();
}

enum ConfirmAction { CAMERA, GALLERY }

class _PickImageRowState extends State<PickImageRow> {
  @override
  Widget build(BuildContext context) {
    final MainModel mainModel = Provider.of<MainModel>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          "Ảnh báo cáo",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 6,
          ),
        ),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: <Widget>[
            ...[
              new UploadBox(),
            ],
            if (mainModel.listImage.isNotEmpty)
              ...mainModel.listImage.map((index) {
                return UploadBox(image: index);
              }).toList()
          ],
        ),
      ],
    );
  }
}

class UploadBox extends StatefulWidget {
  const UploadBox({
    Key key,
    this.image,
  }) : super(key: key);

  final File image;

  @override
  _UploadBoxState createState() => _UploadBoxState();
}

class _UploadBoxState extends State<UploadBox> {
  // File _image;

  void showDemoActionSheet({BuildContext context, Widget child}) {
    showCupertinoModalPopup<String>(
      context: context,
      builder: (BuildContext context) => child,
    ).then((String value) {
      if (value != null) {
        // setState(() { lastSelectedValue = value; });
      }
    });
  }

  Future getImage(MainModel mainModel) async {
    showDemoActionSheet(
      context: context,
      child: CupertinoActionSheet(
        title: const Text('Chọn ảnh'),
        // message: const Text(
        //     'Please select the best dessert from the options below.'),
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: const Text('Máy ảnh'),
            onPressed: () async {
              Navigator.pop(context, 'Máy ảnh');
              File image =
                  await ImagePicker.pickImage(source: ImageSource.camera);

              mainModel.pushToListImage(image);
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Thư viện'),
            onPressed: () async {
              Navigator.pop(context, 'Thư viện');
              File image =
                  await ImagePicker.pickImage(source: ImageSource.gallery);

              mainModel.pushToListImage(image);
            },
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: const Text('Hủy bỏ'),
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context, 'Cancel');
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double widthMinus = width - 16 * 2 - 6 * 3;
    final MainModel mainModel = Provider.of<MainModel>(context);

    return GestureDetector(
      onTap: () {
        getImage(mainModel);
      },
      child: Container(
        height: widthMinus / 4,
        width: widthMinus / 4,
        // color: Colors.red,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: widget.image == null ? Colors.green : Colors.transparent,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(
            6.0,
          ),
        ),
        child: widget.image == null
            ? Icon(
                Icons.add,
                color: Colors.green,
              )
            : Image.file(
                widget.image,
                fit: BoxFit.fitHeight,
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
    double widthMinus = width - 16 * 2 - 11 * 3;
    return Container(
      height: widthMinus / 4 + 8,
      width: widthMinus / 4,
      // color: Colors.teal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          item.image.isEmpty
              ? FlutterLogo()
              : Image.asset(
                  item.image,
                  height: widthMinus / 4,
                  fit: BoxFit.contain,
                ),
        ],
      ),
    );
  }
}

class SupItem {
  SupItem({this.index, this.name, this.image});

  final String image;
  final int index;
  final String name;
}

class MyThreeOptions extends StatefulWidget {
  @override
  _MyThreeOptionsState createState() => _MyThreeOptionsState();
}

class _MyThreeOptionsState extends State<MyThreeOptions> {
  List<SupItem> selectedChoices = [];

  List<SupItem> reportList = [
    SupItem(index: 1, image: "assets/bus.png", name: "Xe"),
    SupItem(index: 2, image: "assets/driver1.png", name: "Tài Xế"),
    SupItem(index: 3, image: "assets/bus_stop1.png", name: "Bến"),
    SupItem(index: 4, image: "assets/app1.png", name: "Ứng dụng"),
    SupItem(index: 5, image: "assets/404.png", name: "Khác"),
  ];
  // List<int> selectedChoices = List();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double widthMinus = width - 16 * 2 - 11 * 3;

    return Wrap(
      spacing: 11,
      runSpacing: 11,
      children: List<Widget>.generate(
        reportList.length,
        (int index) {
          return Container(
            width: widthMinus / 4,
            child: Column(
              children: <Widget>[
                ChoiceChip(
                  // avatar: SupportItem(),

                  clipBehavior: Clip.none,
                  padding: EdgeInsets.all(0),
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
                  // padding: EdgeInsets.all(8),
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
                ),
                Padding(
                  padding: EdgeInsets.only(top: 7),
                ),
                Text(
                  reportList[index].name,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
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
