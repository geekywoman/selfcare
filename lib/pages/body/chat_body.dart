import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selfcare/api/network_util.dart';
import 'package:selfcare/model/message.dart';
import 'package:selfcare/resources/dimens.dart';

class ChatBody extends StatefulWidget {
  @override
  _ChatBodyState createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  final TextEditingController _textController = TextEditingController();
  bool _isComposing = false;
  List<Message> _messages = [Message('Hello, how do you feel today?', true)];

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  void _sendTestQuestions() {
    _handleSubmitted('Hi! I am pregnant. What should I do now?');
//    _handleSubmitted('I feel very nauseous.');
//    _handleSubmitted('I have some backpain, what painkillers can I use?');
//    _handleSubmitted('My baby is moving less then before, is this normal?');
//    _handleSubmitted(
//        'I have really bad cramps, it‘s like period pain but a lot worse. What should I do?');
//    _handleSubmitted(
//        'Hi I have had several really bad headaches last weeks, and I also feel very dizzy, should I talk to a doctor?');
  }

  /// Chat body demo screen
  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(Dimens.smallSpacing),
      child: Column(
        children: <Widget>[
          RaisedButton(
              child: Text('Run test questions'),
              onPressed: () {
                _sendTestQuestions();
              }),
          Flexible(
              child: ListView.builder(
            reverse: true,
            itemCount: _messages.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildMessageItem(_messages[index]);
            },
          )),
          _buildTextComposer(),
        ],
      ),
    );
  }

  Widget _buildMessageItem(Message message) {
    return ListTile(
      title: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: message.incoming
              ? CupertinoColors.activeBlue
              : CupertinoColors.lightBackgroundGray,
        ),
        child: Padding(
          padding: const EdgeInsets.all(Dimens.smallSpacing),
          child: Text(message.text,
              style: message.incoming
                  ? TextStyle(color: Colors.white)
                  : TextStyle(color: Colors.black)),
        ),
      ),
    );
  }

  Widget _buildTextComposer() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: CupertinoColors.lightBackgroundGray),
          borderRadius: BorderRadius.all(Radius.circular(Dimens.radius)),
          color: Theme.of(context).cardColor),
      child: new IconTheme(
        data: new IconThemeData(color: Theme.of(context).accentColor),
        child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: Dimens.tinySpacing),
          child: Padding(
            padding: const EdgeInsets.only(left: Dimens.smallSpacing),
            child: new Row(children: <Widget>[
              new Flexible(
                child: new TextField(
                  controller: _textController,
                  textInputAction: TextInputAction.send,
                  keyboardType: TextInputType.text,
                  onChanged: (String text) {
                    setState(() {
                      _isComposing = text.length > 0;
                    });
                  },
                  onSubmitted: _handleSubmitted,
                  decoration: new InputDecoration.collapsed(
                      hintText: 'Type something...'),
                ),
              ),
              Theme.of(context).platform == TargetPlatform.iOS
                  ? CupertinoButton(
                      child: Text('Send'),
                      onPressed: _isComposing
                          ? () => _handleSubmitted(_textController.text)
                          : null,
                    )
                  : IconButton(
                      icon: new Icon(Icons.send),
                      onPressed: _isComposing
                          ? () => _handleSubmitted(_textController.text)
                          : null,
                    ),
            ]),
          ),
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _isComposing = false;
      _sendMessage(text);
      _messages.add(Message(text, false));
      _messages.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    });
  }

  void _sendMessage(String text) {
    print("Question $text");
    NetworkUtils.instance.getAnswerFromBot(text).then((value) {
      print(value.toString());
      _showResponse(value['output']['text']
          .toString()
          .replaceAll("[", "")
          .replaceAll("]", ""));
    });
  }


  void _showResponse(String response) {
    setState(() {
      print(response);
      _messages.add(Message(response, true));
      _messages.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    });
  }
}
