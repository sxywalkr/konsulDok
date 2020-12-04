import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class XdNewsFeed extends StatelessWidget {
  XdNewsFeed({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff1f9ff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(161.0, 388.0),
            child:
                // Adobe XD layer: 'Pagination' (group)
                SizedBox(
              width: 54.0,
              height: 6.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 6.0, 6.0),
                    size: Size(54.0, 6.0),
                    pinLeft: true,
                    pinTop: true,
                    pinBottom: true,
                    fixedWidth: true,
                    child:
                        // Adobe XD layer: 'Ellipse 8' (shape)
                        Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        color: const Color(0xff2699fb),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(16.0, 0.0, 6.0, 6.0),
                    size: Size(54.0, 6.0),
                    pinTop: true,
                    pinBottom: true,
                    fixedWidth: true,
                    child:
                        // Adobe XD layer: 'Ellipse 9' (shape)
                        Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        color: const Color(0xffbce0fd),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(32.0, 0.0, 6.0, 6.0),
                    size: Size(54.0, 6.0),
                    pinTop: true,
                    pinBottom: true,
                    fixedWidth: true,
                    child:
                        // Adobe XD layer: 'Ellipse 10' (shape)
                        Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        color: const Color(0xffbce0fd),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(48.0, 0.0, 6.0, 6.0),
                    size: Size(54.0, 6.0),
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    fixedWidth: true,
                    child:
                        // Adobe XD layer: 'Ellipse 11' (shape)
                        Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        color: const Color(0xffbce0fd),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(16.0, 418.0),
            child:
                // Adobe XD layer: 'Stories' (group)
                SizedBox(
              width: 343.0,
              height: 464.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 343.0, 104.0),
                    size: Size(343.0, 464.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'new' (group)
                        Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 343.0, 104.0),
                          size: Size(343.0, 104.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child:
                              // Adobe XD layer: 'Rectangle 885' (shape)
                              Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(24.0, 22.0, 183.0, 42.0),
                          size: Size(343.0, 104.0),
                          pinLeft: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child:
                              // Adobe XD layer: 'Excepteur sint occa…' (text)
                              SingleChildScrollView(
                                  child: Text(
                            'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim.',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14,
                              color: const Color(0xff2699fb),
                              height: 1.7142857142857142,
                            ),
                            textAlign: TextAlign.left,
                          )),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(24.0, 71.0, 31.0, 11.0),
                          size: Size(343.0, 104.0),
                          pinLeft: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child:
                              // Adobe XD layer: '1h ago' (text)
                              Text(
                            '1h ago',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 10,
                              color: const Color(0xff2699fb),
                              height: 2.4,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(263.0, 24.0, 56.0, 56.0),
                          size: Size(343.0, 104.0),
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          fixedWidth: true,
                          child:
                              // Adobe XD layer: 'Rectangle 886' (shape)
                              Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffbce0fd),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 120.0, 343.0, 104.0),
                    size: Size(343.0, 464.0),
                    pinLeft: true,
                    pinRight: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'new' (group)
                        Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 343.0, 104.0),
                          size: Size(343.0, 104.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child:
                              // Adobe XD layer: 'Rectangle 885' (shape)
                              Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(24.0, 22.0, 183.0, 42.0),
                          size: Size(343.0, 104.0),
                          pinLeft: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child:
                              // Adobe XD layer: 'Excepteur sint occa…' (text)
                              SingleChildScrollView(
                                  child: Text(
                            'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim.',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14,
                              color: const Color(0xff2699fb),
                              height: 1.7142857142857142,
                            ),
                            textAlign: TextAlign.left,
                          )),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(24.0, 71.0, 31.0, 11.0),
                          size: Size(343.0, 104.0),
                          pinLeft: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child:
                              // Adobe XD layer: '1h ago' (text)
                              Text(
                            '1h ago',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 10,
                              color: const Color(0xff2699fb),
                              height: 2.4,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(263.0, 24.0, 56.0, 56.0),
                          size: Size(343.0, 104.0),
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          fixedWidth: true,
                          child:
                              // Adobe XD layer: 'Rectangle 886' (shape)
                              Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffbce0fd),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 240.0, 343.0, 104.0),
                    size: Size(343.0, 464.0),
                    pinLeft: true,
                    pinRight: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'new' (group)
                        Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 343.0, 104.0),
                          size: Size(343.0, 104.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child:
                              // Adobe XD layer: 'Rectangle 885' (shape)
                              Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(24.0, 22.0, 183.0, 42.0),
                          size: Size(343.0, 104.0),
                          pinLeft: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child:
                              // Adobe XD layer: 'Excepteur sint occa…' (text)
                              SingleChildScrollView(
                                  child: Text(
                            'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim.',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14,
                              color: const Color(0xff2699fb),
                              height: 1.7142857142857142,
                            ),
                            textAlign: TextAlign.left,
                          )),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(24.0, 71.0, 31.0, 11.0),
                          size: Size(343.0, 104.0),
                          pinLeft: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child:
                              // Adobe XD layer: '1h ago' (text)
                              Text(
                            '1h ago',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 10,
                              color: const Color(0xff2699fb),
                              height: 2.4,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(263.0, 24.0, 56.0, 56.0),
                          size: Size(343.0, 104.0),
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          fixedWidth: true,
                          child:
                              // Adobe XD layer: 'Rectangle 886' (shape)
                              Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffbce0fd),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 360.0, 343.0, 104.0),
                    size: Size(343.0, 464.0),
                    pinLeft: true,
                    pinRight: true,
                    pinBottom: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'new' (group)
                        Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 343.0, 104.0),
                          size: Size(343.0, 104.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child:
                              // Adobe XD layer: 'Rectangle 885' (shape)
                              Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(24.0, 22.0, 183.0, 42.0),
                          size: Size(343.0, 104.0),
                          pinLeft: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child:
                              // Adobe XD layer: 'Excepteur sint occa…' (text)
                              SingleChildScrollView(
                                  child: Text(
                            'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim.',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14,
                              color: const Color(0xff2699fb),
                              height: 1.7142857142857142,
                            ),
                            textAlign: TextAlign.left,
                          )),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(24.0, 71.0, 31.0, 11.0),
                          size: Size(343.0, 104.0),
                          pinLeft: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child:
                              // Adobe XD layer: '1h ago' (text)
                              Text(
                            '1h ago',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 10,
                              color: const Color(0xff2699fb),
                              height: 2.4,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(263.0, 24.0, 56.0, 56.0),
                          size: Size(343.0, 104.0),
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          fixedWidth: true,
                          child:
                              // Adobe XD layer: 'Rectangle 886' (shape)
                              Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffbce0fd),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Adobe XD layer: 'Navigation Bar' (group)
          SizedBox(
            width: 375.0,
            height: 68.0,
            child: Stack(
              children: <Widget>[
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(0.0, 0.0, 375.0, 20.0),
                  size: Size(375.0, 68.0),
                  pinLeft: true,
                  pinRight: true,
                  pinTop: true,
                  fixedHeight: true,
                  child:
                      // Adobe XD layer: 'Rectangle 68' (shape)
                      Container(
                    decoration: BoxDecoration(),
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(0.0, 20.0, 375.0, 48.0),
                  size: Size(375.0, 68.0),
                  pinLeft: true,
                  pinRight: true,
                  pinTop: true,
                  pinBottom: true,
                  child:
                      // Adobe XD layer: 'Rectangle 69' (shape)
                      Container(
                    decoration: BoxDecoration(),
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(356.0, 37.0, 3.0, 15.0),
                  size: Size(375.0, 68.0),
                  pinRight: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child:
                      // Adobe XD layer: 'More' (group)
                      Stack(
                    children: <Widget>[
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(0.0, 0.0, 3.0, 15.0),
                        size: Size(3.0, 15.0),
                        pinLeft: true,
                        pinRight: true,
                        pinTop: true,
                        pinBottom: true,
                        child:
                            // Adobe XD layer: 'Union 1' (group)
                            Stack(
                          children: <Widget>[
                            Pinned.fromSize(
                              bounds: Rect.fromLTWH(0.0, 0.0, 3.0, 3.0),
                              size: Size(3.0, 15.0),
                              pinLeft: true,
                              pinRight: true,
                              pinTop: true,
                              fixedHeight: true,
                              child:
                                  // Adobe XD layer: 'Ellipse 3' (shape)
                                  Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(9999.0, 9999.0)),
                                  color: const Color(0xff2699fb),
                                ),
                              ),
                            ),
                            Pinned.fromSize(
                              bounds: Rect.fromLTWH(0.0, 6.0, 3.0, 3.0),
                              size: Size(3.0, 15.0),
                              pinLeft: true,
                              pinRight: true,
                              fixedHeight: true,
                              child:
                                  // Adobe XD layer: 'Ellipse 4' (shape)
                                  Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(9999.0, 9999.0)),
                                  color: const Color(0xff2699fb),
                                ),
                              ),
                            ),
                            Pinned.fromSize(
                              bounds: Rect.fromLTWH(0.0, 12.0, 3.0, 3.0),
                              size: Size(3.0, 15.0),
                              pinLeft: true,
                              pinRight: true,
                              pinBottom: true,
                              fixedHeight: true,
                              child:
                                  // Adobe XD layer: 'Ellipse 5' (shape)
                                  Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(9999.0, 9999.0)),
                                  color: const Color(0xff2699fb),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(167.0, 35.0, 42.0, 16.0),
                  size: Size(375.0, 68.0),
                  fixedWidth: true,
                  fixedHeight: true,
                  child:
                      // Adobe XD layer: 'NEWS' (text)
                      Text(
                    'NEWS',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14,
                      color: const Color(0xff2699fb),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(16.0, 36.0, 16.0, 16.0),
                  size: Size(375.0, 68.0),
                  pinLeft: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child:
                      // Adobe XD layer: 'Menu' (group)
                      Stack(
                    children: <Widget>[
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(0.0, 0.0, 16.0, 16.0),
                        size: Size(16.0, 16.0),
                        pinLeft: true,
                        pinRight: true,
                        pinTop: true,
                        pinBottom: true,
                        child:
                            // Adobe XD layer: 'Rectangle 175' (shape)
                            Container(
                          decoration: BoxDecoration(),
                        ),
                      ),
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(0.0, 1.0, 16.0, 14.0),
                        size: Size(16.0, 16.0),
                        pinLeft: true,
                        pinRight: true,
                        pinTop: true,
                        pinBottom: true,
                        child:
                            // Adobe XD layer: 'Union 4' (group)
                            Stack(
                          children: <Widget>[
                            Pinned.fromSize(
                              bounds: Rect.fromLTWH(0.0, 0.0, 16.0, 2.0),
                              size: Size(16.0, 14.0),
                              pinLeft: true,
                              pinRight: true,
                              pinTop: true,
                              fixedHeight: true,
                              child:
                                  // Adobe XD layer: 'Rectangle 172' (shape)
                                  Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xff2699fb),
                                ),
                              ),
                            ),
                            Pinned.fromSize(
                              bounds: Rect.fromLTWH(0.0, 6.0, 16.0, 2.0),
                              size: Size(16.0, 14.0),
                              pinLeft: true,
                              pinRight: true,
                              fixedHeight: true,
                              child:
                                  // Adobe XD layer: 'Rectangle 173' (shape)
                                  Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xff2699fb),
                                ),
                              ),
                            ),
                            Pinned.fromSize(
                              bounds: Rect.fromLTWH(0.0, 12.0, 8.0, 2.0),
                              size: Size(16.0, 14.0),
                              pinLeft: true,
                              pinBottom: true,
                              fixedWidth: true,
                              fixedHeight: true,
                              child:
                                  // Adobe XD layer: 'Rectangle 174' (shape)
                                  Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xff2699fb),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(16.0, 76.0),
            child:
                // Adobe XD layer: 'Card' (group)
                SizedBox(
              width: 343.0,
              height: 288.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 343.0, 184.0),
                    size: Size(343.0, 288.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'Rectangle 883' (shape)
                        Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffbce0fd),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 184.0, 343.0, 104.0),
                    size: Size(343.0, 288.0),
                    pinLeft: true,
                    pinRight: true,
                    pinBottom: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'info' (group)
                        Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 343.0, 104.0),
                          size: Size(343.0, 104.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child:
                              // Adobe XD layer: 'Rectangle 884' (shape)
                              Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(24.0, 32.0, 134.0, 45.0),
                          size: Size(343.0, 104.0),
                          pinLeft: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child:
                              // Adobe XD layer: 'Lorem ipsum dolor s…' (text)
                              SingleChildScrollView(
                                  child: Text(
                            'Lorem ipsum dolor sit amet, conse ctetur adipisicing.',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14,
                              color: const Color(0xff2699fb),
                              height: 1.7142857142857142,
                            ),
                            textAlign: TextAlign.left,
                          )),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(188.0, 44.0, 126.0, 16.0),
                          size: Size(343.0, 104.0),
                          pinRight: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child:
                              // Adobe XD layer: 'Likes/Comments' (group)
                              Stack(
                            children: <Widget>[
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(0.0, 0.0, 47.0, 16.0),
                                size: Size(126.0, 16.0),
                                pinLeft: true,
                                pinTop: true,
                                pinBottom: true,
                                fixedWidth: true,
                                child:
                                    // Adobe XD layer: 'likes' (group)
                                    Stack(
                                  children: <Widget>[
                                    Pinned.fromSize(
                                      bounds:
                                          Rect.fromLTWH(24.0, 0.0, 23.0, 16.0),
                                      size: Size(47.0, 16.0),
                                      pinRight: true,
                                      pinTop: true,
                                      pinBottom: true,
                                      fixedWidth: true,
                                      child:
                                          // Adobe XD layer: '609' (text)
                                          Text(
                                        '609',
                                        style: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 14,
                                          color: const Color(0xff2699fb),
                                          fontWeight: FontWeight.w700,
                                          height: 1.7142857142857142,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Pinned.fromSize(
                                      bounds:
                                          Rect.fromLTWH(0.0, 0.0, 16.0, 16.0),
                                      size: Size(47.0, 16.0),
                                      pinLeft: true,
                                      pinTop: true,
                                      pinBottom: true,
                                      fixedWidth: true,
                                      child:
                                          // Adobe XD layer: 'Symbol 97 – 5' (group)
                                          Stack(
                                        children: <Widget>[
                                          Pinned.fromSize(
                                            bounds: Rect.fromLTWH(
                                                0.0, 1.0, 16.0, 14.1),
                                            size: Size(16.0, 16.0),
                                            pinLeft: true,
                                            pinRight: true,
                                            pinTop: true,
                                            pinBottom: true,
                                            child:
                                                // Adobe XD layer: 'Heart' (shape)
                                                SvgPicture.string(
                                              _svg_otnimo,
                                              allowDrawingOutsideViewBox: true,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Pinned.fromSize(
                                            bounds: Rect.fromLTWH(
                                                0.0, 0.0, 16.0, 16.0),
                                            size: Size(16.0, 16.0),
                                            pinLeft: true,
                                            pinRight: true,
                                            pinTop: true,
                                            pinBottom: true,
                                            child:
                                                // Adobe XD layer: 'Rectangle 1450' (shape)
                                                Container(
                                              decoration: BoxDecoration(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(79.0, 0.0, 47.0, 16.0),
                                size: Size(126.0, 16.0),
                                pinRight: true,
                                pinTop: true,
                                pinBottom: true,
                                fixedWidth: true,
                                child:
                                    // Adobe XD layer: 'comments' (group)
                                    Stack(
                                  children: <Widget>[
                                    Pinned.fromSize(
                                      bounds:
                                          Rect.fromLTWH(24.0, 0.0, 23.0, 16.0),
                                      size: Size(47.0, 16.0),
                                      pinRight: true,
                                      pinTop: true,
                                      pinBottom: true,
                                      fixedWidth: true,
                                      child:
                                          // Adobe XD layer: '120' (text)
                                          Text(
                                        '120',
                                        style: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 14,
                                          color: const Color(0xff2699fb),
                                          fontWeight: FontWeight.w700,
                                          height: 1.7142857142857142,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Pinned.fromSize(
                                      bounds:
                                          Rect.fromLTWH(0.0, 0.0, 16.0, 16.0),
                                      size: Size(47.0, 16.0),
                                      pinLeft: true,
                                      pinTop: true,
                                      pinBottom: true,
                                      fixedWidth: true,
                                      child:
                                          // Adobe XD layer: 'Symbol 96 – 14' (group)
                                          Stack(
                                        children: <Widget>[
                                          Pinned.fromSize(
                                            bounds: Rect.fromLTWH(
                                                0.0, 0.0, 16.0, 16.0),
                                            size: Size(16.0, 16.0),
                                            pinLeft: true,
                                            pinRight: true,
                                            pinTop: true,
                                            pinBottom: true,
                                            child:
                                                // Adobe XD layer: 'Chat' (shape)
                                                SvgPicture.string(
                                              _svg_x6h3bg,
                                              allowDrawingOutsideViewBox: true,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_otnimo =
    '<svg viewBox="0.0 1.0 16.0 14.1" ><path transform="translate(-0.03, 0.97)" d="M 14.74600410461426 1.303996920585632 C 13.04067516326904 -0.4013324081897736 10.33220958709717 -0.4013324081897736 8.62688159942627 1.303996920585632 L 8.02500057220459 1.905877828598022 L 7.42311954498291 1.303996920585632 C 5.717790126800537 -0.4013323187828064 3.009326219558716 -0.4013323187828064 1.303996920585632 1.303996920585632 C -0.4013324081897736 3.009326219558716 -0.4013324081897736 5.717790126800537 1.303996920585632 7.423119068145752 L 8.02500057220459 14.14412307739258 L 14.74600410461426 7.423120021820068 C 16.45133209228516 5.717790126800537 16.45133209228516 3.009326219558716 14.74600410461426 1.303996920585632" fill="#2699fb" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_x6h3bg =
    '<svg viewBox="0.0 0.0 16.0 16.0" ><path  d="M 5 8 C 5 8.600000381469727 5.400000095367432 9 6 9 L 10 9 C 10.5 9 11 8.600000381469727 11 8 C 11 7.400000095367432 10.60000038146973 7 10 7 L 6 7 C 5.5 7 5 7.400000095367432 5 8 Z M 0 5 C 0 2.200000047683716 2.200000047683716 0 5 0 L 11 0 C 13.80000019073486 0 16 2.200000047683716 16 5 L 16 15 C 16 15.60000038146973 15.60000038146973 16 15 16 L 5 16 C 2.200000047683716 16 0 13.80000019073486 0 11 L 0 5 Z" fill="#2699fb" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
