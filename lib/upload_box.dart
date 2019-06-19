import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'main.dart';

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
              if (image != null) {
                if (image.existsSync()) {
                  mainModel.pushToListImage(image);
                }
              }
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Thư viện'),
            onPressed: () async {
              Navigator.pop(context, 'Thư viện');
              File image =
                  await ImagePicker.pickImage(source: ImageSource.gallery);
              if (image != null) {
                if (image.existsSync()) {
                  mainModel.pushToListImage(image);
                }
              }
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
