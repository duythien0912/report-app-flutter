import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChatScreen();
  }
}

class ChatScreen extends StatefulWidget {
  ChatScreen({Key key}) : super(key: key);

  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];
  bool _isComposing = false;

  @override
  void initState() {
    super.initState();
    _textController.addListener(_printLatestValue);
    ChatMessage message = ChatMessage(
      typeChat: TypeChat.Admin,
      text: "Hello Im Bộ",
      animationController: new AnimationController(
        duration: new Duration(milliseconds: 700),
        vsync: this,
      ),
    );
    _textController.clear();
    _textController.text = '';
    _textController.clearComposing();

    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
  }

  _printLatestValue() {
    print("text field: ${_textController.text}");
  }

  @override
  void dispose() {
    for (ChatMessage message in _messages)
      message.animationController.dispose();

    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phản ánh số 01"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                autofocus: true,
                controller: _textController,
                onSubmitted: _handleSubmitted,
                onChanged: (String text) {
                  setState(() {
                    _isComposing = text.length > 0;
                  });
                },
                decoration:
                    InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: _isComposing
                    ? () => _handleSubmitted(_textController.text)
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    print(text);
    if (_textController.text.isNotEmpty) {
      ChatMessage message = ChatMessage(
        typeChat: TypeChat.User,
        text: text,
        animationController: new AnimationController(
          duration: new Duration(milliseconds: 700),
          vsync: this,
        ),
      );
      _textController.clear();
      _textController.text = '';
      _textController.clearComposing();

      setState(() {
        _messages.insert(0, message);
      });
      message.animationController.forward();
    }
  }
}

enum TypeChat { Admin, User }

class ChatMessage extends StatelessWidget {
  ChatMessage({
    this.typeChat = TypeChat.User,
    this.text,
    this.animationController,
  });
  final TypeChat typeChat;
  final String text;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    const String _name = "Your Name";
    double deviceWidth = MediaQuery.of(context).size.width;

    return SizeTransition(
      sizeFactor: new CurvedAnimation(
          parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: Container(
        // margin: const EdgeInsets.symmetric(vertical: 0.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            if (typeChat == TypeChat.User)
              SizedBox(
                width: deviceWidth / 7,
              ),
            // Container(
            //   height: 30,
            //   width: 30,
            //   margin: const EdgeInsets.only(right: 8.0),
            //   child: CircleAvatar(
            //     backgroundColor: Colors.black26,
            //     backgroundImage: AssetImage(
            //       "assets/bus.png",
            //     ),
            //     child: Text(_name[0]),
            //   ),
            // ),
            if (typeChat == TypeChat.User)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    // Text(_name, style: Theme.of(context).textTheme.subhead),
                    Container(
                      padding: EdgeInsets.only(
                        top: 4,
                        bottom: 8,
                        left: 12,
                        right: 12,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Color.fromRGBO(240, 240, 240, 1),
                        ),
                        color: Color.fromRGBO(240, 240, 240, 1),
                        borderRadius: BorderRadius.circular(
                          14.0,
                        ),
                      ),
                      margin: const EdgeInsets.only(top: 5.0),
                      child: Text(text),
                    ),
                  ],
                ),
              ),
            if (typeChat == TypeChat.Admin)
              Container(
                height: 25,
                width: 25,
                margin: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.black26,
                  backgroundImage: AssetImage(
                    "assets/bus.png",
                  ),
                  child: Text(_name[0]),
                ),
              ),
            if (typeChat == TypeChat.Admin)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Text(_name, style: Theme.of(context).textTheme.subhead),
                    Container(
                      padding: EdgeInsets.only(
                        top: 8,
                        bottom: 8,
                        left: 12,
                        right: 12,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.black38,
                        ),
                        borderRadius: BorderRadius.circular(
                          16.0,
                        ),
                      ),
                      margin: const EdgeInsets.only(top: 5.0),
                      child: Text(text),
                    ),
                  ],
                ),
              ),
            if (typeChat == TypeChat.Admin)
              SizedBox(
                width: deviceWidth / 7,
              ),
          ],
        ),
      ),
    );
  }
}

class ChatMessageAdmin extends StatelessWidget {
  ChatMessageAdmin({this.text, this.animationController});
  final String text;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    const String _name = "Your Name";
    double deviceWidth = MediaQuery.of(context).size.width;

    return SizeTransition(
      sizeFactor: new CurvedAnimation(
          parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              height: 30,
              width: 30,
              margin: const EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                backgroundColor: Colors.black26,
                backgroundImage: AssetImage(
                  "assets/bus.png",
                ),
                child: Text(_name[0]),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  top: 4,
                  bottom: 8,
                  left: 12,
                  right: 12,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.black38,
                  ),
                  borderRadius: BorderRadius.circular(
                    16.0,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Text(_name, style: Theme.of(context).textTheme.subhead),
                    Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      child: Text(text),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: deviceWidth / 7,
            )
          ],
        ),
      ),
    );
  }
}
