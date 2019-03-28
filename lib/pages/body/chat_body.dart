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

  /// Chat body demo screen
  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(Dimens.smallSpacing),
      child: Column(
        children: <Widget>[
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
    NetworkUtils.instance.getNaturalLanguageKeywords(text).then((value) {
      print("success");
      print(value);
      List<String> keywords = List();
      List<dynamic> keywordObjects = value['keywords'];
      keywordObjects.forEach((value) {
        if (value['relevance'] > 0.5) {
          String relevantKeyword = value['text'];
          keywords.add(relevantKeyword);
          print("relevant keyword found $relevantKeyword");
        } else {
          print("not relevant enough");
        }
      });
      setState(() {
        _messages.add(Message("Keywords found ${keywords.toString()}", true));
        _messages.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      });
    });
  }
}
