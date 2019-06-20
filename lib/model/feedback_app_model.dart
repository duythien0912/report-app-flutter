import 'dart:io';

import 'package:flutter/material.dart';

class FeedbackAppModel with ChangeNotifier {
  List<File> _listImage = [];

  List<File> get listImage => _listImage;

  void pushToListImage(File newFile) {
    _listImage.add(newFile);
    notifyListeners();
  }
}
