import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class XdDiscoverActivities extends StatelessWidget {
  XdDiscoverActivities({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff0f3f4),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(0.0, 100.0),
            child: SvgPicture.string(
              _svg_vims3x,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 100.0),
            child:
                // Adobe XD layer: 'hero' (shape)
                Container(
              width: 375.0,
              height: 180.0,
              decoration: BoxDecoration(
                color: const Color(0xff87bcbf),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(17.4, 1343.0),
            child:
                // Adobe XD layer: 'Recommended' (text)
                SizedBox(
              width: 151.0,
              child: Text(
                'Recommended',
                style: TextStyle(
                  fontFamily: 'Europa',
                  fontSize: 18,
                  color: const Color(0xff1b1c20),
                  fontWeight: FontWeight.w700,
                  height: 1.9444444444444444,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(16.0, 649.0),
            child:
                // Adobe XD layer: 'card_activity_large' (none)
                SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 30,
                runSpacing: 20,
                children: [
                  {
                    'text': 'Yoga',
                    'text_0': 'Moderate Intensity',
                  },
                  {
                    'text': 'Meditation',
                    'text_0': 'Low Intensity',
                  },
                  {
                    'text': 'Weight Lifting',
                    'text_0': 'High Intensity',
                  }
                ].map((map) {
                  final text = map['text'];
                  final text_0 = map['text_0'];
                  return Transform.translate(
                    offset: Offset(10.0, 0.0),
                    child:
                        // Adobe XD layer: 'card_activity_large' (group)
                        SizedBox(
                      width: 320.0,
                      height: 210.0,
                      child: Stack(
                        children: <Widget>[
                          // Adobe XD layer: 'card' (shape)
                          Container(
                            width: 320.0,
                            height: 210.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: const AssetImage(''),
                                fit: BoxFit.cover,
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(1.0),
                                    BlendMode.dstIn),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x29000000),
                                  offset: Offset(0, 10),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(19.5, 120.0),
                            child: Text(
                              text,
                              style: TextStyle(
                                fontFamily: 'Europa',
                                fontSize: 30,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w700,
                                height: 1.1666666666666667,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(19.5, 160.0),
                            child: Text(
                              text_0,
                              style: TextStyle(
                                fontFamily: 'Europa',
                                fontSize: 15,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w300,
                                height: 2.3333333333333335,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(8.0, 392.0),
            child:
                // Adobe XD layer: 'card_surfing' (none)
                GridView.count(
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              crossAxisCount: 3,
              childAspectRatio: 0.75,
              children: [
                {
                  'text': 'OCEAN BEACH',
                  'text_0': 'Surfing',
                },
                {
                  'text': 'TORREY PINES',
                  'text_0': 'Hiking\n',
                },
                {
                  'text': 'ENCINITAS',
                  'text_0': 'Yoga',
                }
              ].map((map) {
                final text = map['text'];
                final text_0 = map['text_0'];
                return
                    // Adobe XD layer: 'card_activity_small' (group)
                    SizedBox(
                  width: 136.0,
                  height: 182.0,
                  child: Stack(
                    children: <Widget>[
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(0.0, 0.0, 136.0, 182.0),
                        size: Size(136.0, 182.0),
                        pinLeft: true,
                        pinRight: true,
                        pinTop: true,
                        pinBottom: true,
                        child:
                            // Adobe XD layer: 'card' (shape)
                            Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: const Color(0xffffffff),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0x1a1b1c20),
                                offset: Offset(0, 10),
                                blurRadius: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(0.0, 0.0, 136.0, 107.2),
                        size: Size(136.0, 182.0),
                        pinLeft: true,
                        pinRight: true,
                        pinTop: true,
                        fixedHeight: true,
                        child:
                            // Adobe XD layer: 'mask' (shape)
                            SvgPicture.string(
                          _svg_fw8qom,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(28.0, 153.0, 80.0, 14.0),
                        size: Size(136.0, 182.0),
                        pinBottom: true,
                        fixedWidth: true,
                        fixedHeight: true,
                        child: Text(
                          text,
                          style: TextStyle(
                            fontFamily: 'Rift Soft',
                            fontSize: 10,
                            color: const Color(0xff7d8184),
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(42.0, 132.0, 52.0, 20.0),
                        size: Size(136.0, 182.0),
                        fixedWidth: true,
                        fixedHeight: true,
                        child: Text(
                          text_0,
                          style: TextStyle(
                            fontFamily: 'Europa',
                            fontSize: 15,
                            color: const Color(0xff334856),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(46.0, 84.0, 45.0, 45.0),
                        size: Size(136.0, 182.0),
                        fixedWidth: true,
                        fixedHeight: true,
                        child:
                            // Adobe XD layer: 'icn_surfing' (group)
                            Stack(
                          children: <Widget>[
                            Pinned.fromSize(
                              bounds: Rect.fromLTWH(0.0, 0.0, 45.0, 45.0),
                              size: Size(45.0, 45.0),
                              pinLeft: true,
                              pinRight: true,
                              pinTop: true,
                              pinBottom: true,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(9999.0, 9999.0)),
                                  color: const Color(0xffffffff),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0x29425965),
                                      offset: Offset(0, 10),
                                      blurRadius: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(55.1, 92.5, 28.0, 28.0),
                        size: Size(136.0, 182.0),
                        fixedWidth: true,
                        fixedHeight: true,
                        child:
                            // Adobe XD layer: '1_surf' (shape)
                            SvgPicture.string(
                          _svg_kzdlb7,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          Transform.translate(
            offset: Offset(4.2, 351.0),
            child: SizedBox(
              width: 178.0,
              child: Text(
                'Popular Near You',
                style: TextStyle(
                  fontFamily: 'Europa',
                  fontSize: 18,
                  color: const Color(0xff1b1c20),
                  fontWeight: FontWeight.w700,
                  height: 1.9444444444444444,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(15.3, 270.0),
            child:
                // Adobe XD layer: 'search_bar' (group)
                SizedBox(
              width: 346.0,
              height: 56.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 344.2, 56.0),
                    size: Size(345.7, 56.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child:
                        // Adobe XD layer: 'bg' (shape)
                        SvgPicture.string(
                      _svg_apkcc5,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(25.7, 17.0, 100.0, 20.0),
                    size: Size(345.7, 56.0),
                    pinLeft: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      'Search Activities',
                      style: TextStyle(
                        fontFamily: 'Europa',
                        fontSize: 15,
                        color: const Color(0xff6e8ca0),
                        fontWeight: FontWeight.w300,
                        height: 2.3333333333333335,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(289.7, 0.0, 56.0, 56.0),
                    size: Size(345.7, 56.0),
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    fixedWidth: true,
                    child:
                        // Adobe XD layer: 'bg' (shape)
                        SvgPicture.string(
                      _svg_2pz2yk,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(),
                ],
              ),
            ),
          ),
          Container(),
          Transform.translate(
            offset: Offset(35.0, 127.0),
            child:
                // Adobe XD layer: 'hero image' (group)
                SizedBox(
              width: 266.0,
              height: 115.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 266.0, 115.0),
                    size: Size(266.0, 115.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child:
                        // Adobe XD layer: 'messaging' (group)
                        Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(1.0, 0.0, 130.0, 72.0),
                          size: Size(266.0, 115.0),
                          pinLeft: true,
                          pinTop: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child: Text(
                            'Discover \nActivities',
                            style: TextStyle(
                              fontFamily: 'Europa',
                              fontSize: 30,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w700,
                              height: 1.0666666666666667,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 91.0, 266.0, 24.0),
                          size: Size(266.0, 115.0),
                          pinLeft: true,
                          pinRight: true,
                          pinBottom: true,
                          fixedHeight: true,
                          child: Text(
                            'Discover fun new activities below:',
                            style: TextStyle(
                              fontFamily: 'Europa',
                              fontSize: 18,
                              color: const Color(0xffffffff),
                              height: 1.3888888888888888,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.5, 81.5, 33.4, 1.0),
                          size: Size(266.0, 115.0),
                          pinLeft: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child:
                              // Adobe XD layer: 'divider' (shape)
                              SvgPicture.string(
                            _svg_mdsfx7,
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
            offset: Offset(8.0, 1382.0),
            child:
                // Adobe XD layer: 'card_surfing' (none)
                GridView.count(
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              crossAxisCount: 3,
              childAspectRatio: 0.75,
              children: [
                {
                  'text': 'OCEAN BEACH',
                  'text_0': 'Surfing',
                },
                {
                  'text': 'TORREY PINES',
                  'text_0': 'Hiking\n',
                },
                {
                  'text': 'ENCINITAS',
                  'text_0': 'Yoga',
                }
              ].map((map) {
                final text = map['text'];
                final text_0 = map['text_0'];
                return
                    // Adobe XD layer: 'card_activity_small' (group)
                    SizedBox(
                  width: 136.0,
                  height: 182.0,
                  child: Stack(
                    children: <Widget>[
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(0.0, 0.0, 136.0, 182.0),
                        size: Size(136.0, 182.0),
                        pinLeft: true,
                        pinRight: true,
                        pinTop: true,
                        pinBottom: true,
                        child:
                            // Adobe XD layer: 'card' (shape)
                            Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: const Color(0xffffffff),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0x1a1b1c20),
                                offset: Offset(0, 10),
                                blurRadius: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(0.0, 0.0, 136.0, 107.2),
                        size: Size(136.0, 182.0),
                        pinLeft: true,
                        pinRight: true,
                        pinTop: true,
                        fixedHeight: true,
                        child:
                            // Adobe XD layer: 'mask' (shape)
                            SvgPicture.string(
                          _svg_fw8qom,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(28.0, 153.0, 80.0, 14.0),
                        size: Size(136.0, 182.0),
                        pinBottom: true,
                        fixedWidth: true,
                        fixedHeight: true,
                        child: Text(
                          text,
                          style: TextStyle(
                            fontFamily: 'Rift Soft',
                            fontSize: 10,
                            color: const Color(0xff7d8184),
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(42.0, 132.0, 52.0, 20.0),
                        size: Size(136.0, 182.0),
                        fixedWidth: true,
                        fixedHeight: true,
                        child: Text(
                          text_0,
                          style: TextStyle(
                            fontFamily: 'Europa',
                            fontSize: 15,
                            color: const Color(0xff334856),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(46.0, 84.0, 45.0, 45.0),
                        size: Size(136.0, 182.0),
                        fixedWidth: true,
                        fixedHeight: true,
                        child:
                            // Adobe XD layer: 'icn_surfing' (group)
                            Stack(
                          children: <Widget>[
                            Pinned.fromSize(
                              bounds: Rect.fromLTWH(0.0, 0.0, 45.0, 45.0),
                              size: Size(45.0, 45.0),
                              pinLeft: true,
                              pinRight: true,
                              pinTop: true,
                              pinBottom: true,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(9999.0, 9999.0)),
                                  color: const Color(0xffffffff),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0x29425965),
                                      offset: Offset(0, 10),
                                      blurRadius: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(55.1, 92.5, 28.0, 28.0),
                        size: Size(136.0, 182.0),
                        fixedWidth: true,
                        fixedHeight: true,
                        child:
                            // Adobe XD layer: '1_surf' (shape)
                            SvgPicture.string(
                          _svg_kzdlb7,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          Transform.translate(
            offset: Offset(24.0, 603.0),
            child: Text(
              'Featured Activities',
              style: TextStyle(
                fontFamily: 'Europa',
                fontSize: 18,
                color: const Color(0xff1b1c20),
                fontWeight: FontWeight.w700,
                height: 1.9444444444444444,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 704.0),
            child:
                // Adobe XD layer: 'app_bar' (group)
                SizedBox(
              width: 375.0,
              height: 108.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 38.2, 375.0, 70.0),
                    size: Size(375.0, 108.2),
                    pinLeft: true,
                    pinRight: true,
                    pinBottom: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'bg' (group)
                        Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 375.0, 70.0),
                          size: Size(375.0, 70.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child: SvgPicture.string(
                            _svg_a2b2xj,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(147.0, 0.0, 82.0, 82.0),
                    size: Size(375.0, 108.2),
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'icn_add' (group)
                        Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 82.0, 82.0),
                          size: Size(82.0, 82.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                        Container(),
                      ],
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(243.0, 79.0, 44.0, 11.0),
                    size: Size(375.0, 108.2),
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      'DISCOVER',
                      style: TextStyle(
                        fontFamily: 'Rift Soft',
                        fontSize: 8,
                        color: const Color(0xffd97d54),
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(),
                  Container(),
                  Container(),
                  Container(),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 1.0),
            child:
                // Adobe XD layer: 'bar_nav' (group)
                SizedBox(
              width: 375.0,
              height: 100.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 375.0, 100.0),
                    size: Size(375.0, 100.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child:
                        // Adobe XD layer: 'bg' (shape)
                        SvgPicture.string(
                      _svg_hieccs,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(),
                  Container(),
                  Container(),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(336.0, 42.6, 15.6, 15.6),
                    size: Size(375.0, 100.0),
                    pinRight: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'icn_notification' (group)
                        Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 15.6, 15.6),
                          size: Size(15.6, 15.6),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                              color: const Color(0xff87bcbf),
                              border: Border.all(
                                  width: 2.0, color: const Color(0xffffffff)),
                            ),
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(6.0, 2.0, 4.0, 10.0),
                          size: Size(15.6, 15.6),
                          pinTop: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child: Text(
                            '2',
                            style: TextStyle(
                              fontFamily: 'Europa',
                              fontSize: 7,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w700,
                              height: 5.857142857142857,
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
          Container(),
        ],
      ),
    );
  }
}

const String _svg_fw8qom =
    '<svg viewBox="15.0 357.0 136.0 107.2" ><defs><pattern id="image" patternUnits="userSpaceOnUse" width="300.0" height="300.0"><image xlink:href="null" x="0" y="0" width="300.0" height="300.0" /></pattern></defs><path transform="translate(15.0, 357.0)" d="M 15 0 L 121 0 C 129.2842712402344 0 136 6.715729713439941 136 15 L 136 107.22265625 L 0 107.22265625 L 0 15 C 0 6.715729713439941 6.715729713439941 0 15 0 Z" fill="url(#image)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_kzdlb7 =
    '<svg viewBox="70.1 449.5 28.0 28.0" ><defs><pattern id="image" patternUnits="userSpaceOnUse" width="120.0" height="120.0"><image xlink:href="null" x="0" y="0" width="120.0" height="120.0" /></pattern></defs><path transform="translate(-3.05, -5.05)" d="M 87.11753845214844 454.5761413574219 L 73.11754608154297 468.5760192871094 L 87.11753845214844 482.5761108398438 L 101.117546081543 468.5760192871094 L 87.11753845214844 454.5761413574219 Z" fill="url(#image)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vims3x =
    '<svg viewBox="0.0 100.0 375.0 200.0" ><path transform="translate(0.0, 100.0)" d="M 0 0 L 375 0 L 375 200 L 0 200 L 0 0 Z" fill="#87bcbf" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_apkcc5 =
    '<svg viewBox="15.3 244.0 344.2 56.0" ><defs><filter id="shadow"><feDropShadow dx="0" dy="20" stdDeviation="30"/></filter></defs><path transform="translate(20.0, 244.0)" d="M -0.6640625 0 L 335.521484375 0 C 337.7306213378906 0 339.521484375 1.790861129760742 339.521484375 4 L 339.521484375 52 C 339.521484375 54.20913696289063 337.7306213378906 56 335.521484375 56 L -0.6640625 56 C -2.873201370239258 56 -4.6640625 54.20913696289063 -4.6640625 52 L -4.6640625 4 C -4.6640625 1.790861129760742 -2.873201370239258 0 -0.6640625 0 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" filter="url(#shadow)"/></svg>';
const String _svg_2pz2yk =
    '<svg viewBox="305.0 244.0 56.0 56.0" ><path transform="translate(305.0, 244.0)" d="M 0 0 L 51 0 C 53.76142501831055 0 56 2.238576173782349 56 5 L 56 51 C 56 53.76142501831055 53.76142501831055 56 51 56 L 0 56 L 0 0 Z" fill="#d97d54" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_mdsfx7 =
    '<svg viewBox="33.5 232.5 33.4 1.0" ><path transform="translate(33.5, 232.5)" d="M 0 0 L 33.41015625 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_a2b2xj =
    '<svg viewBox="0.0 598.2 375.0 70.0" ><defs><filter id="shadow"><feDropShadow dx="0" dy="-5" stdDeviation="30"/></filter></defs><path transform="translate(0.0, 598.16)" d="M 0 0 L 375 0 L 375 70 L 0 70 L 0 0 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" filter="url(#shadow)"/></svg>';
const String _svg_hieccs =
    '<svg viewBox="1.0 0.0 375.0 100.0" ><defs><filter id="shadow"><feDropShadow dx="0" dy="0" stdDeviation="10"/></filter></defs><path transform="translate(1.0, 0.0)" d="M 0 0 L 375 0 L 375 100 L 0 100 L 0 0 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" filter="url(#shadow)"/></svg>';
