import 'package:flutter_chat/chatData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/chatWidget.dart';

class Chat2Screen extends StatefulWidget {
  static const String id = "welcome_screen";
  @override
  _Chat2ScreenState createState() => _Chat2ScreenState();
}

class _Chat2ScreenState extends State<Chat2Screen> {
  @override
  void initState() {
    super.initState();
    ChatData.init("Just Chat", context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ChatWidget.getAppBar(),
        backgroundColor: Colors.white,
        body: ChatWidget.widgetWelcomeScreen(context));
  }
}
