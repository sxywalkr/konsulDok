import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home21Screen extends StatelessWidget {
  Home21Screen({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Container(
            width: 412.0,
            height: 331.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(96.0),
                bottomLeft: Radius.circular(96.0),
              ),
              color: const Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x29000000),
                  offset: Offset(0, 6),
                  blurRadius: 6,
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(24.0, 84.0),
            child:
                // Adobe XD layer: 'Hero' (group)
                SizedBox(
              width: 363.0,
              height: 188.0,
              child: Stack(
                children: <Widget>[
                  Container(),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(137.0, 72.0, 92.0, 22.0),
                    size: Size(363.0, 188.0),
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      'John Doe',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 20,
                        color: const Color(0xff2699fb),
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(140.0, 100.0, 84.0, 11.0),
                    size: Size(363.0, 188.0),
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      'San Francisco, CA',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 10,
                        color: const Color(0xff2699fb),
                        height: 2.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 148.0, 363.0, 40.0),
                    size: Size(363.0, 188.0),
                    pinLeft: true,
                    pinRight: true,
                    pinBottom: true,
                    fixedHeight: true,
                    child: Text(
                      'Hi! My name is John, I’m a creative geek from San Francisco, CA. Contact me at john@mail.com',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14,
                        color: const Color(0xff2699fb),
                        height: 1.7142857142857142,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(49.0, 364.0),
            child:
                // Adobe XD layer: 'Info' (group)
                SizedBox(
              width: 314.0,
              height: 41.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(213.0, 11.0, 2.0, 24.0),
                    size: Size(314.0, 41.0),
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffbce0fd),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(266.0, 0.0, 32.0, 22.0),
                    size: Size(314.0, 41.0),
                    pinRight: true,
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      '24k',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 20,
                        color: const Color(0xff2699fb),
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(250.0, 30.0, 64.0, 11.0),
                    size: Size(314.0, 41.0),
                    pinRight: true,
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      'FOLLOWERS',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 10,
                        color: const Color(0xff2699fb),
                        fontWeight: FontWeight.w700,
                        height: 2.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 34.0, 22.0),
                    size: Size(314.0, 41.0),
                    pinLeft: true,
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      '140',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 20,
                        color: const Color(0xff2699fb),
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 30.0, 34.0, 11.0),
                    size: Size(314.0, 41.0),
                    pinLeft: true,
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      'SHOTS',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 10,
                        color: const Color(0xff2699fb),
                        fontWeight: FontWeight.w700,
                        height: 2.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(84.0, 11.0, 2.0, 24.0),
                    size: Size(314.0, 41.0),
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffbce0fd),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(131.0, 0.0, 34.0, 22.0),
                    size: Size(314.0, 41.0),
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      '140',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 20,
                        color: const Color(0xff2699fb),
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(121.0, 30.0, 54.0, 11.0),
                    size: Size(314.0, 41.0),
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      'PROJECTS',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 10,
                        color: const Color(0xff2699fb),
                        fontWeight: FontWeight.w700,
                        height: 2.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(24.0, 473.0),
            child:
                // Adobe XD layer: 'Post' (none)
                SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 20,
                children: [{}, {}, {}, {}].map((map) {
                  return
                      // Adobe XD layer: 'Post' (group)
                      SizedBox(
                    width: 326.0,
                    height: 232.0,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: 326.0,
                          height: 232.0,
                          decoration: BoxDecoration(
                            color: const Color(0xffbce0fd),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(24.0, 192.0),
                          child:
                              // Adobe XD layer: 'likes' (group)
                              SizedBox(
                            width: 47.0,
                            height: 16.0,
                            child: Stack(
                              children: <Widget>[
                                Pinned.fromSize(
                                  bounds: Rect.fromLTWH(24.0, 0.0, 23.0, 16.0),
                                  size: Size(47.0, 16.0),
                                  pinRight: true,
                                  pinTop: true,
                                  pinBottom: true,
                                  fixedWidth: true,
                                  child: Text(
                                    '609',
                                    style: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 14,
                                      color: const Color(0xffffffff),
                                      fontWeight: FontWeight.w700,
                                      height: 1.7142857142857142,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Pinned.fromSize(
                                  bounds: Rect.fromLTWH(0.0, 1.0, 16.0, 14.1),
                                  size: Size(47.0, 16.0),
                                  pinLeft: true,
                                  pinTop: true,
                                  pinBottom: true,
                                  fixedWidth: true,
                                  child: Stack(
                                    children: <Widget>[
                                      Pinned.fromSize(
                                        bounds:
                                            Rect.fromLTWH(0.0, 0.0, 16.0, 14.1),
                                        size: Size(16.0, 14.1),
                                        pinLeft: true,
                                        pinRight: true,
                                        pinTop: true,
                                        pinBottom: true,
                                        child:
                                            // Adobe XD layer: 'Heart' (shape)
                                            SvgPicture.string(
                                          _svg_lz6auh,
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
                        ),
                        Transform.translate(
                          offset: Offset(103.0, 192.0),
                          child:
                              // Adobe XD layer: 'comments' (group)
                              SizedBox(
                            width: 47.0,
                            height: 16.0,
                            child: Stack(
                              children: <Widget>[
                                Pinned.fromSize(
                                  bounds: Rect.fromLTWH(24.0, 0.0, 23.0, 16.0),
                                  size: Size(47.0, 16.0),
                                  pinRight: true,
                                  pinTop: true,
                                  pinBottom: true,
                                  fixedWidth: true,
                                  child: Text(
                                    '120',
                                    style: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 14,
                                      color: const Color(0xffffffff),
                                      fontWeight: FontWeight.w700,
                                      height: 1.7142857142857142,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Pinned.fromSize(
                                  bounds: Rect.fromLTWH(0.0, 0.0, 16.0, 16.0),
                                  size: Size(47.0, 16.0),
                                  pinLeft: true,
                                  pinTop: true,
                                  pinBottom: true,
                                  fixedWidth: true,
                                  child: Stack(
                                    children: <Widget>[
                                      Pinned.fromSize(
                                        bounds:
                                            Rect.fromLTWH(0.0, 0.0, 16.0, 16.0),
                                        size: Size(16.0, 16.0),
                                        pinLeft: true,
                                        pinRight: true,
                                        pinTop: true,
                                        pinBottom: true,
                                        child:
                                            // Adobe XD layer: 'Chat' (shape)
                                            SvgPicture.string(
                                          _svg_v42mk4,
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
                        ),
                        Transform.translate(
                          offset: Offset(242.2, 191.0),
                          child: SizedBox(
                            width: 59.0,
                            child: Text(
                              'SHARE',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 14,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w700,
                                height: 1.7142857142857142,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}

const String _svg_lz6auh =
    '<svg viewBox="0.0 0.0 16.0 14.1" ><path transform="translate(-0.02, -0.02)" d="M 14.74600410461426 1.303996920585632 C 13.04067516326904 -0.4013324081897736 10.33220958709717 -0.4013324081897736 8.62688159942627 1.303996920585632 L 8.02500057220459 1.905877828598022 L 7.42311954498291 1.303996920585632 C 5.717790126800537 -0.4013323187828064 3.009326219558716 -0.4013323187828064 1.303996920585632 1.303996920585632 C -0.4013324081897736 3.009326219558716 -0.4013324081897736 5.717790126800537 1.303996920585632 7.423119068145752 L 8.02500057220459 14.14412307739258 L 14.74600410461426 7.423120021820068 C 16.45133209228516 5.717790126800537 16.45133209228516 3.009326219558716 14.74600410461426 1.303996920585632" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_v42mk4 =
    '<svg viewBox="0.0 0.0 16.0 16.0" ><path  d="M 5 8 C 5 8.600000381469727 5.400000095367432 9 6 9 L 10 9 C 10.5 9 11 8.600000381469727 11 8 C 11 7.400000095367432 10.60000038146973 7 10 7 L 6 7 C 5.5 7 5 7.400000095367432 5 8 Z M 0 5 C 0 2.200000047683716 2.200000047683716 0 5 0 L 11 0 C 13.80000019073486 0 16 2.200000047683716 16 5 L 16 15 C 16 15.60000038146973 15.60000038146973 16 15 16 L 5 16 C 2.200000047683716 16 0 13.80000019073486 0 11 L 0 5 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
