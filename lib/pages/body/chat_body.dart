import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selfcare/api/network_util.dart';
import 'package:selfcare/resources/dimens.dart';

class ChatBody extends StatefulWidget {
  @override
  _ChatBodyState createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  final TextEditingController _textController = TextEditingController();
  bool _isComposing = false;

  @override
  Widget build(BuildContext context) {
    NetworkUtils.instance
        .getNaturalLanguageKeywords("I have a headache")
        .then((value) {
      print("success");
      print(value);
    });

    return _buildBody();
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(Dimens.smallSpacing),
      child: Column(
        children: <Widget>[
          Flexible(
              child: ListView(
            reverse: true,
            children: <Widget>[
              ListTile(
                title: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: CupertinoColors.activeBlue,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(Dimens.smallSpacing),
                    child: Text(
                        'Hi, I would like to ask you some question about my treatment',
                        style: TextStyle(color: Colors.white)),
                  ),
                ), //todo remove dummy data
              ),
              ListTile(
                title: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: CupertinoColors.lightBackgroundGray,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(Dimens.smallSpacing),
                    child: Text(
                      'Hello, how do you feel today?',
                    ),
                  ),
                ), //todo remove dummy data
              ),
            ],
          )),
          _buildTextComposer(),
        ],
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
    //todo handle submission
  }
}
