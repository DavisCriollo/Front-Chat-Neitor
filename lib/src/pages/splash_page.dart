
// import 'package:NeitorVet/src/pages/splahZona_page.dart';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:neitorvet/src/pages/zona_page.dart';
import 'package:neitorvet/src/utils/responsive.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {



  @override
  void initState() {
    Future.delayed(Duration(seconds: 6), () {
      return Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => FadeIn(
            duration: Duration(seconds: 2),
            child: ZonaPage(),
          ),
        ),
      );
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    return Container(
       child: Stack(
         children: [
           Container(
             width: size.wScreen(100),
             height: size.hScreen(100),
             child: Image.asset('assets/imgs/capaSplash.png',
             fit: BoxFit.cover,),
             ),
            Center(
              child:  BounceInDown(
                  from: 300,
                  duration: Duration(milliseconds: 2000),
                  delay: Duration(milliseconds: 2000),
                  child: Image.asset('assets/imgs/logo_neitor.png',
                  // width: size.iScreen(80),
                  height: size.iScreen(20),
                  ),
                ),
            ),
         ],
       ),
    );
  }
}