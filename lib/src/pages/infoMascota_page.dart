

// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neitorvet/src/utils/responsive.dart';

class InfoMascotaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    return Scaffold(
      // backgroundColor: Color(0xFFDEF0FA),
      // backgroundColor: Colors.red,
      // appBar: AppBar(
      //   title: Text('Mascota'),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: size.wScreen(100),
              height: size.hScreen(35),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                width: 8.0,
                color: Color(0xFF0092D0),
              ))),
              child: Stack(
                // alignment: Alignment.center,
                children: [
                  Container(
                    // color: Colors.blue,
                    width: size.wScreen(100),
                    height: size.hScreen(35),
                  ),
                  Hero(
                    tag: '1',
                    child: Container(
                      width: size.wScreen(100.0),
                      height: size.hScreen(35),
                      decoration: BoxDecoration(
                          // color: Colors.red,
                          // border: Border(
                          //     bottom: BorderSide(
                          //   width: 5.0,
                          //   color: Color(0xFF963594),
                          // )),
                          ),
                      child: Image.asset(
                        'assets/imgs/img-demo.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  FlatButton(
                    splashColor: Colors.transparent,
                    child: Icon(
                      FontAwesomeIcons.chevronLeft,
                      size: size.iScreen(3.3),
                    ),
                    onPressed: () {
                       Navigator.pop(context);
                      // Navigator.pushNamed(context, 'mascotas');
                    },
                  ),
                  Positioned(
                    bottom: size.iScreen(2.5),
                    child: FlatButton(
                        splashColor: Colors.transparent,
                        onPressed: () {},
                        child: Icon(
                          FontAwesomeIcons.camera,
                          color: Colors.white,
                          size: size.iScreen(3.5),
                        )),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.iScreen(3.0),
                      vertical: size.iScreen(3.0)),
                  width: size.wScreen(100.0),
                  color: Color(0xFFDEF0FA),
                  child: Column(
                    children: [
                      Container(
                        width: size.wScreen(100.0),
                        alignment: Alignment.centerLeft,
                        // color: Colors.red,
                        margin: EdgeInsets.only(
                          top: size.iScreen(1.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Container(
                                  // color: Colors.red,
                                  width: size.wScreen(65.0),
                                  child: Text(
                                    'Mastod ',
                                    style: TextStyle(
                                        fontSize: size.iScreen(2.6),
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF971B81)),
                                  ),
                                ),
                                Container(
                                  // color: Colors.blue,
                                  width: size.wScreen(65.0),
                                  child: Text('golden retriever',
                                      style: TextStyle(
                                          fontSize: size.iScreen(2),
                                          color: Colors.black)),
                                ),
                              ],
                            ),
                            Text(
                              '2 años',
                              style: TextStyle(
                                  fontSize: size.iScreen(2.3),
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: size.wScreen(100.0),
                        margin: EdgeInsets.only(
                          top: size.iScreen(2.0),
                        ),
                        child: Text(
                          'El golden retriever, también conocido como cobrador dasdkahsdkhaksdhjhkhkh asdlasdla  gjgjgjhgjghjhgjhgjhgjhgjhgjhgjhgjhgjhgj lsdnalsdnlandlansdlansldnalsdnalsdalsdnalsdnasldkn   khkhkhkhkhkhkhkkasdhaksdhaksdhaksdhaksdhaksjdhaksjdhk dorado es originario de Reino Unido, más concretamente de Escocia. Nace alrededor del 1850 con la búsqueda de un perro cobrador y levantador que fuera capaz de no lastimar a la presa. Por ese motivo observamos en él habilidades de caza. También es conocido como perdiguero dorado.asdlajsdlajsdljasldkjaslkdjalskdjalskdjalskdjaslkdj',
                          style: TextStyle(
                              fontSize: size.iScreen(2), color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
