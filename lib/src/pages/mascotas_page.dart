

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neitorvet/src/pages/infoMascota_page.dart';
import 'package:neitorvet/src/utils/responsive.dart';

class MisMascotasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDEEAF6),
      appBar: AppBar(
        title: Text('Mis Mascotas'),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ItemsMascotas(),
        ],
      ),
    );
  }
}

class ItemsMascotas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => InfoMascotaPage()),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: size.iScreen(2.0), vertical: size.iScreen(1.0)),
        width: size.wScreen(100.0),
        height: size.hScreen(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)), // color: Colors.red,

          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(2, 2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0)),
              child: Hero(
                tag: '1',
                child: Container(
                  height: size.hScreen(10.0),
                  width: size.hScreen(10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.6),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    ),
                  ),
                  // child: Image.network(
                  //   'https://picsum.photos/id/237/200/300',
                  //   fit: BoxFit.cover,
                  // ),
                   child: Image.asset(
                    'assets/imgs/dog.png',
                    fit: BoxFit.contain,
                    // alignment: Alignment.center,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(size.iScreen(1.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Beethoven',
                           style: GoogleFonts.roboto(
                                  fontSize: size.iScreen(2.5),
                                  color: Color(0xFF971B81),
                                ),
                        ),
                        Text(
                          'golden retriever',
                          style: GoogleFonts.roboto(
                                  fontSize: size.iScreen(2.0),
                                  color: Colors.black,
                                ),
                        ),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: size.iScreen(0.3),
                          height: size.iScreen(4.5),
                          color: Colors.grey,
                          margin: EdgeInsets.only(right: size.iScreen(0.9)),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '2',
                               style: GoogleFonts.roboto(
                                  fontSize: size.iScreen(2.5),
                                  color: Colors.black,
                                ),
                            ),
                            Text(
                              'años',
                              style: GoogleFonts.roboto(
                                  fontSize: size.iScreen(2.0),
                                  color: Colors.black,
                                ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
