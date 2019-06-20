import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/feedback_app_model.dart';
import 'upload_box.dart';

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
    final FeedbackAppModel mainModel = Provider.of<FeedbackAppModel>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          "Hình ảnh",
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
