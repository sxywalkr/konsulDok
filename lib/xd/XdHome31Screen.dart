import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

class XdHome31Screen extends StatelessWidget {
  XdHome31Screen({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          // Adobe XD layer: 'App bar / 1. Top /A…' (group)
          SizedBox(
            width: 360.0,
            height: 80.0,
            child: Stack(
              children: <Widget>[
                Container(),
                Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
