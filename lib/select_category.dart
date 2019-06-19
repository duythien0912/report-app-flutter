import 'package:flutter/material.dart';

import 'support_item.dart';

class SupItem {
  SupItem({this.index, this.name, this.image});

  final String image;
  final int index;
  final String name;
}

class SelectCategory extends StatefulWidget {
  @override
  _SelectCategoryState createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  bool isReachLeft = true;
  bool isReachRight = false;
  List<SupItem> reportList = [
    SupItem(index: 1, image: "assets/bus.png", name: "Xe"),
    SupItem(index: 2, image: "assets/driver1.png", name: "Tài Xế"),
    SupItem(index: 3, image: "assets/bus_stop1.png", name: "Bến"),
    SupItem(index: 4, image: "assets/app1.png", name: "Ứng dụng"),
    SupItem(index: 5, image: "assets/404.png", name: "Khác"),
  ];

  List<SupItem> selectedChoices = [];

  // List<int> selectedChoices = List();
  ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);

    super.initState();
  }

  _scrollListener() {
    String message;
    if (_controller.offset >= _controller.position.maxScrollExtent) {
      setState(() {
        message = "reach the right";
        isReachRight = true;
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent) {
      setState(() {
        message = "reach the left";
        isReachLeft = true;
      });
    }
    if (message == null) {
      setState(() {
        isReachRight = false;
        isReachLeft = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double widthMinus = width - 16 * 2 - 11 * 3;

    // return Wrap(
    //   spacing: 11,
    //   runSpacing: 11,
    //   children: List<Widget>.generate(
    //     reportList.length,
    //     (int index) {
    //       return Container(
    //         width: widthMinus / 4,
    //         child: Column(
    //           children: <Widget>[
    //             ChoiceChip(
    //               // avatar: SupportItem(),

    //               clipBehavior: Clip.none,
    //               padding: EdgeInsets.all(0),
    //               shape: ShapeBorder.lerp(
    //                   RoundedRectangleBorder(
    //                     side: BorderSide(
    //                       color: selectedChoices.contains(reportList[index])
    //                           ? Color(0xFF00800d)
    //                           : Colors.transparent,
    //                       width: 1.5,
    //                     ),
    //                     // side: const BorderSide(width: 1.0),
    //                     borderRadius: BorderRadius.circular(
    //                       8.0,
    //                     ),
    //                   ),
    //                   RoundedRectangleBorder(
    //                     side: BorderSide(
    //                       color: selectedChoices.contains(reportList[index])
    //                           ? Color(0xFF00800d)
    //                           : Colors.transparent,
    //                       width: 1,
    //                     ),
    //                     // side: const BorderSide(width: 1.0),
    //                     borderRadius: BorderRadius.circular(
    //                       8.0,
    //                     ),
    //                   ),
    //                   0.0),
    //               backgroundColor: Colors.grey[200],
    //               shadowColor: Colors.transparent,
    //               selectedShadowColor: Colors.transparent,
    //               // padding: EdgeInsets.all(8),
    //               selectedColor: Colors.grey[200],
    //               label: SupportItem(item: reportList[index]),
    //               selected: selectedChoices.contains(reportList[index]),
    //               onSelected: (bool selected) {
    //                 // setState(() {
    //                 //   _value = selected ? index : null;
    //                 // });
    //                 selectedChoices.contains(reportList[index])
    //                     ? selectedChoices.remove(reportList[index])
    //                     : selectedChoices.add(reportList[index]);
    //                 setState(() {
    //                   selectedChoices = selectedChoices;
    //                 });

    //                 print(selectedChoices);
    //               },
    //             ),
    //             Padding(
    //               padding: EdgeInsets.only(top: 7),
    //             ),
    //             Text(
    //               reportList[index].name,
    //               style: TextStyle(
    //                 fontSize: 12,
    //               ),
    //               overflow: TextOverflow.visible,
    //               textAlign: TextAlign.center,
    //             ),
    //           ],
    //         ),
    //       );
    //     },
    //   ).toList(),
    // );

    return Container(
      width: double.infinity,
      height: widthMinus / 4 + 48,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: ListView(
              controller: _controller,

              scrollDirection: Axis.horizontal,
              // spacing: 11,
              // runSpacing: 11,
              children: List<Widget>.generate(
                reportList.length,
                (int index) {
                  return Container(
                    width: widthMinus / 3 + 5,
                    child: Column(
                      children: <Widget>[
                        ChoiceChip(
                          // avatar: SupportItem(),

                          clipBehavior: Clip.none,
                          padding: EdgeInsets.all(0),
                          shape: ShapeBorder.lerp(
                              RoundedRectangleBorder(
                                side: BorderSide(
                                  color: selectedChoices
                                          .contains(reportList[index])
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
                                  color: selectedChoices
                                          .contains(reportList[index])
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
            ),
          ),
          if (!isReachRight)
            Padding(
              padding: const EdgeInsets.only(bottom: 28, right: 7),
              child: Align(
                alignment: Alignment.centerRight,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Container(
                    color: Colors.black54,
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ),
          if (!isReachLeft)
            Padding(
              padding: const EdgeInsets.only(bottom: 28, left: 7),
              child: Align(
                alignment: Alignment.centerLeft,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Container(
                    color: Colors.black54,
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
