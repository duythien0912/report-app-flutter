import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateFeedback extends StatefulWidget {
  const CreateFeedback({Key key}) : super(key: key);

  @override
  _CreateFeedbackState createState() => _CreateFeedbackState();
}

class _CreateFeedbackState extends State<CreateFeedback> {
  int _currentStep = 0;
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stepper(
              currentStep: _currentStep,
              onStepTapped: (int step) => setState(() => _currentStep = step),
              onStepContinue: _currentStep < 3
                  ? () => setState(() => _currentStep += 1)
                  : null,
              onStepCancel: _currentStep > 0
                  ? () => setState(() => _currentStep -= 1)
                  : null,
              steps: [
                Step(
                  title: Text("Nội dung"),
                  content: TextField(
                    decoration: InputDecoration(
                      labelText: "Nội dung",
                    ),
                    maxLines: 3,
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 0
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: Text("Hình ảnh"),
                  content: Row(
                    children: <Widget>[
                      FloatingActionButton(
                        onPressed: getImage,
                        tooltip: 'Pick Image',
                        child: Icon(
                          Icons.add_a_photo,
                          size: 15,
                        ),
                        mini: true,
                      ),
                      _image != null
                          ? Image.file(
                              _image,
                              height: 100,
                            )
                          : Container(),
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 1
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: Text("Constructor1"),
                  content: Text("Let's look at its construtor."),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 2
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  // subtitle: Text("heool"),
                  title: Text("Constructor2"),
                  content: Text("Let's look at its construtor."),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 3
                      ? StepState.complete
                      : StepState.disabled,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
