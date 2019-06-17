import 'package:flutter/material.dart';

import 'select_category.dart';

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
