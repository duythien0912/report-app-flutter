import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'chat_page.dart';
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
            // primarySwatch: Colors.green,
            // accentColorBrightness: Brightness.light,
            ),
        home: ChatPage(),
      ),
    );
  }
}
