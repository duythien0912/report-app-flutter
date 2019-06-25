import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/feedback_app_model.dart';

import 'feedback_page.dart';

// import 'package:flutter/services.dart';

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
        ChangeNotifierProvider(builder: (_) => FeedbackAppModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            // primarySwatch: Colors.green,
            // accentColorBrightness: Brightness.light,
            ),
        home: FeedbackPage(),
      ),
    );
  }
}
