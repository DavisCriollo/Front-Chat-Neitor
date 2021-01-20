// import 'package:NeitorVet/src/pages/splahZona_page.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class SplashLogo extends StatefulWidget {
  @override
  _SplashLogoState createState() => _SplashLogoState();
}

class _SplashLogoState extends State<SplashLogo> {
  @override
  void initState() {
    // Future.delayed(Duration(seconds: 6), () {
    //   return Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (BuildContext context) => FadeIn(
    //         duration: Duration(seconds: 2),
    //         child: SplashZonaPage(),
    //       ),
    //     ),
    //   );
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // color: Color(0xFF1b384a),
          color: Color(0xFF1b384a),
          padding: EdgeInsets.all(40.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BounceInDown(
                  from: 300,
                  duration: Duration(milliseconds: 2000),
                  delay: Duration(milliseconds: 2000),
                  child: Image.asset('assets/imgs/logo.png'),
                ),
                SizedBox(
                  height: 40.0,
                ),
                FadeInLeft(
                  delay: Duration(milliseconds: 2000),
                  duration: Duration(milliseconds: 2000),
                  child: Text(
                    'Sistema Veterinario',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color(
                            0xFF1de9b6) /*Colors.white.withOpacity(0.7)*/),
                  ),
                ),
                FadeInLeft(
                    delay: Duration(milliseconds: 2000),
                    duration: Duration(milliseconds: 2000),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                      child: LinearProgressIndicator(),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
