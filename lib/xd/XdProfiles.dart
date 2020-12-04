import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class XdProfiles extends StatelessWidget {
  XdProfiles({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffafafa),
      body: Stack(
        children: <Widget>[
          // Adobe XD layer: 'Navigation Bar' (group)
          SizedBox(
            width: 375.0,
            height: 100.0,
            child: Stack(
              children: <Widget>[
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(0.0, 0.0, 375.0, 20.0),
                  size: Size(375.0, 100.0),
                  pinLeft: true,
                  pinRight: true,
                  pinTop: true,
                  fixedHeight: true,
                  child:
                      // Adobe XD layer: 'Rectangle 248' (shape)
                      Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff2699fb),
                    ),
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(0.0, 20.0, 375.0, 80.0),
                  size: Size(375.0, 100.0),
                  pinLeft: true,
                  pinRight: true,
                  pinTop: true,
                  pinBottom: true,
                  child:
                      // Adobe XD layer: 'Rectangle 249' (shape)
                      Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff2699fb),
                    ),
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(157.0, 37.0, 62.0, 14.0),
                  size: Size(375.0, 100.0),
                  fixedWidth: true,
                  fixedHeight: true,
                  child:
                      // Adobe XD layer: 'JOHN DOE' (text)
                      Text(
                    'JOHN DOE',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(16.0, 36.0, 16.0, 16.0),
                  size: Size(375.0, 100.0),
                  pinLeft: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child:
                      // Adobe XD layer: 'menu' (group)
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
                            // Adobe XD layer: 'Rectangle 250' (shape)
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
                            // Adobe XD layer: 'Union 8' (group)
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
                                  // Adobe XD layer: 'Rectangle 251' (shape)
                                  Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffffffff),
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
                                  // Adobe XD layer: 'Rectangle 252' (shape)
                                  Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffffffff),
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
                                  // Adobe XD layer: 'Rectangle 253' (shape)
                                  Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffffffff),
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
                  bounds: Rect.fromLTWH(343.0, 36.0, 16.0, 16.0),
                  size: Size(375.0, 100.0),
                  pinRight: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child:
                      // Adobe XD layer: 'search' (group)
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
                            // Adobe XD layer: 'Rectangle 254' (shape)
                            Container(
                          decoration: BoxDecoration(),
                        ),
                      ),
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(0.0, 0.0, 15.9, 15.9),
                        size: Size(16.0, 16.0),
                        pinLeft: true,
                        pinRight: true,
                        pinTop: true,
                        pinBottom: true,
                        child:
                            // Adobe XD layer: 'Path 112' (shape)
                            SvgPicture.string(
                          _svg_jqcbsq,
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
          Transform.translate(
            offset: Offset(16.0, 300.0),
            child:
                // Adobe XD layer: 'Stats' (group)
                SizedBox(
              width: 343.0,
              height: 109.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 109.0, 109.0),
                    size: Size(343.0, 109.0),
                    pinLeft: true,
                    pinTop: true,
                    pinBottom: true,
                    fixedWidth: true,
                    child:
                        // Adobe XD layer: 'Information' (group)
                        Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 109.0, 109.0),
                          size: Size(109.0, 109.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child:
                              // Adobe XD layer: 'Rectangle 251' (shape)
                              Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfff1f9ff),
                            ),
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(24.0, 34.0, 33.0, 22.0),
                          size: Size(109.0, 109.0),
                          fixedWidth: true,
                          fixedHeight: true,
                          child:
                              // Adobe XD layer: '140' (text)
                              Text(
                            '140',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 20,
                              color: const Color(0xff2699fb),
                              height: 1.2,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(24.0, 64.0, 42.0, 11.0),
                          size: Size(109.0, 109.0),
                          fixedWidth: true,
                          fixedHeight: true,
                          child:
                              // Adobe XD layer: 'PHOTOS' (text)
                              Text(
                            'PHOTOS',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 10,
                              color: const Color(0xff2699fb),
                              fontWeight: FontWeight.w700,
                              height: 2.4,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(117.0, 0.0, 109.0, 109.0),
                    size: Size(343.0, 109.0),
                    pinTop: true,
                    pinBottom: true,
                    fixedWidth: true,
                    child:
                        // Adobe XD layer: 'Information' (group)
                        Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 109.0, 109.0),
                          size: Size(109.0, 109.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child:
                              // Adobe XD layer: 'Rectangle 251' (shape)
                              Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfff1f9ff),
                            ),
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(24.0, 34.0, 36.0, 22.0),
                          size: Size(109.0, 109.0),
                          fixedWidth: true,
                          fixedHeight: true,
                          child:
                              // Adobe XD layer: '24K' (text)
                              Text(
                            '24K',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 20,
                              color: const Color(0xff2699fb),
                              height: 1.2,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(24.0, 64.0, 64.0, 11.0),
                          size: Size(109.0, 109.0),
                          fixedWidth: true,
                          fixedHeight: true,
                          child:
                              // Adobe XD layer: 'FOLLOWERS' (text)
                              Text(
                            'FOLLOWERS',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 10,
                              color: const Color(0xff2699fb),
                              fontWeight: FontWeight.w700,
                              height: 2.4,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(234.0, 0.0, 109.0, 109.0),
                    size: Size(343.0, 109.0),
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    fixedWidth: true,
                    child:
                        // Adobe XD layer: 'Information' (group)
                        Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 109.0, 109.0),
                          size: Size(109.0, 109.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child:
                              // Adobe XD layer: 'Rectangle 251' (shape)
                              Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfff1f9ff),
                            ),
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(24.0, 34.0, 50.0, 22.0),
                          size: Size(109.0, 109.0),
                          fixedWidth: true,
                          fixedHeight: true,
                          child:
                              // Adobe XD layer: '1,890' (text)
                              Text(
                            '1,890',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 20,
                              color: const Color(0xff2699fb),
                              height: 1.2,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(24.0, 64.0, 61.0, 11.0),
                          size: Size(109.0, 109.0),
                          fixedWidth: true,
                          fixedHeight: true,
                          child:
                              // Adobe XD layer: 'FOLLOWING' (text)
                              Text(
                            'FOLLOWING',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 10,
                              color: const Color(0xff2699fb),
                              fontWeight: FontWeight.w700,
                              height: 2.4,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(16.0, 417.0),
            child:
                // Adobe XD layer: 'Info' (group)
                SizedBox(
              width: 343.0,
              height: 109.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 343.0, 109.0),
                    size: Size(343.0, 109.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child:
                        // Adobe XD layer: 'Rectangle 254' (shape)
                        Container(
                      decoration: BoxDecoration(
                        color: const Color(0xfff1f9ff),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(24.0, 23.0, 295.0, 64.0),
                    size: Size(343.0, 109.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child:
                        // Adobe XD layer: 'Hi! My name is John…' (text)
                        SingleChildScrollView(
                            child: Text(
                      'Hi! My name is John, I’m a creative geek from San Francisco, CA. I enjoy creating eye candy solutions for web and mobile apps. Contact me at john@mail.com',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14,
                        color: const Color(0xff2699fb),
                        height: 1.7142857142857142,
                      ),
                      textAlign: TextAlign.left,
                    )),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(16.0, 84.0),
            child:
                // Adobe XD layer: 'Photo' (group)
                SizedBox(
              width: 343.0,
              height: 208.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 343.0, 208.0),
                    size: Size(343.0, 208.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child:
                        // Adobe XD layer: 'Rectangle 240' (shape)
                        Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffbce0fd),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(287.0, 16.0, 40.0, 40.0),
                    size: Size(343.0, 208.0),
                    pinRight: true,
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: '+' (group)
                        Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 40.0, 40.0),
                          size: Size(40.0, 40.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child:
                              // Adobe XD layer: 'Ellipse 100' (shape)
                              Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                              color: const Color(0xff7fc4fd),
                            ),
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(12.0, 12.0, 16.0, 16.0),
                          size: Size(40.0, 40.0),
                          fixedWidth: true,
                          fixedHeight: true,
                          child:
                              // Adobe XD layer: '+' (group)
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
                                    // Adobe XD layer: 'Union 1' (group)
                                    Stack(
                                  children: <Widget>[
                                    Pinned.fromSize(
                                      bounds:
                                          Rect.fromLTWH(7.0, 0.0, 2.0, 16.0),
                                      size: Size(16.0, 16.0),
                                      pinTop: true,
                                      pinBottom: true,
                                      fixedWidth: true,
                                      child:
                                          // Adobe XD layer: 'Rectangle 2' (shape)
                                          Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                    Pinned.fromSize(
                                      bounds:
                                          Rect.fromLTWH(7.0, 0.0, 2.0, 16.0),
                                      size: Size(16.0, 16.0),
                                      pinLeft: true,
                                      pinRight: true,
                                      fixedHeight: true,
                                      child: Transform.rotate(
                                        angle: 1.5708,
                                        child:
                                            // Adobe XD layer: 'Rectangle 3' (shape)
                                            Container(
                                          decoration: BoxDecoration(
                                            color: const Color(0xffffffff),
                                          ),
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
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(16.0, 534.0),
            child:
                // Adobe XD layer: 'Teams' (group)
                SizedBox(
              width: 343.0,
              height: 134.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 343.0, 134.0),
                    size: Size(343.0, 134.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child:
                        // Adobe XD layer: 'Rectangle 255' (shape)
                        Container(
                      decoration: BoxDecoration(
                        color: const Color(0xfff1f9ff),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(24.0, 22.0, 49.0, 16.0),
                    size: Size(343.0, 134.0),
                    pinLeft: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'TEAMS' (text)
                        Text(
                      'TEAMS',
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
                    bounds: Rect.fromLTWH(24.0, 62.0, 40.0, 40.0),
                    size: Size(343.0, 134.0),
                    pinLeft: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'Ellipse 101' (shape)
                        Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        color: const Color(0xffbce0fd),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(80.0, 62.0, 40.0, 40.0),
                    size: Size(343.0, 134.0),
                    fixedWidth: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'Ellipse 102' (shape)
                        Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        color: const Color(0xffbce0fd),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(136.0, 62.0, 40.0, 40.0),
                    size: Size(343.0, 134.0),
                    fixedWidth: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'Ellipse 103' (shape)
                        Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        color: const Color(0xffbce0fd),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(248.0, 62.0, 71.0, 40.0),
                    size: Size(343.0, 134.0),
                    pinRight: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'button' (group)
                        Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 71.0, 40.0),
                          size: Size(71.0, 40.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child:
                              // Adobe XD layer: 'Rectangle 286' (shape)
                              Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: const Color(0xff2699fb),
                            ),
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(25.0, 15.0, 22.0, 11.0),
                          size: Size(71.0, 40.0),
                          fixedWidth: true,
                          fixedHeight: true,
                          child:
                              // Adobe XD layer: 'ADD' (text)
                              Text(
                            'ADD',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 10,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w700,
                              height: 2.4,
                            ),
                            textAlign: TextAlign.center,
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

const String _svg_jqcbsq =
    '<svg viewBox="343.0 36.0 15.9 15.9" ><path transform="translate(343.0, 36.0)" d="M 15.89999961853027 14.5 L 12.59999942779541 11.19999980926514 C 13.5 10 14 8.600000381469727 14 7 C 14 3.099999904632568 10.89999961853027 0 7 0 C 3.100000381469727 0 0 3.099999904632568 0 7 C 0 10.89999961853027 3.099999904632568 14 7 14 C 8.600000381469727 14 10 13.5 11.19999980926514 12.60000038146973 L 14.5 15.90000057220459 L 15.89999961853027 14.5 Z M 2 7 C 2 4.199999809265137 4.199999809265137 2 7 2 C 9.800000190734863 2 12 4.199999809265137 12 7 C 12 9.800000190734863 9.800000190734863 12 7 12 C 4.199999809265137 12 2 9.800000190734863 2 7 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
