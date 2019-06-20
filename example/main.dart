import "package:pika_feedback_app/feedback_page.dart";
import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  const Example({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FeedbackPage(
        hasDrawer: true,
      ),
    );
  }
}
