import 'package:flutter/material.dart';

import 'pick_image_row.dart';
import 'select_category.dart';

class CustomFeedback extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          // controller: controller,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,

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
                child: Text("Chọn nội dung phản ánh"),
              ),
              SelectCategory(),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 6,
                ),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
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

              Expanded(
                child: SizedBox(),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 20,
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
