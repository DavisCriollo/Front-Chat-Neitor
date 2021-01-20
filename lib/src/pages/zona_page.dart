
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neitorvet/src/utils/responsive.dart';
import 'package:neitorvet/src/widget/dropDounMenu.dart';

class ZonaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List data = ['UNO', 'DOS', 'TRES', 'CUATRO', 'CINCO', 'SEIS'];
    final Responsive size = Responsive.of(context);
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              width: size.wScreen(100),
              height: size.hScreen(100),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF963594).withOpacity(0.8),
                    Color(0xFF0092D0).withOpacity(0.75),
                  ],
                  stops: [0.2, 0.6],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: size.wScreen(100),
                  height: size.hScreen(40),
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: size.wScreen(100),
                        height: size.iScreen(20),
                        child: Image.asset(
                          'assets/imgs/logo_neitor.png',
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            '¡ Bienvenido a NeitorVet !',
                            style: GoogleFonts.roboto(
                              fontSize: size.iScreen(3.0),
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Seleccione la información solicitada',
                            style: GoogleFonts.roboto(
                              fontSize: size.iScreen(1.7),
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: size.iScreen(2.0)),
                    // color:Colors.green,
                    child: Column(
                      children: [
                        Container(
                          child: DropMenu(
                            title: 'Seleccione Zona',
                            data: data,
                            hinText: 'Zona',
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(vertical: size.iScreen(0.0)),
                          child: DropMenu(
                            title: 'Seleccione Empresa',
                            data: data,
                            hinText: 'Empresa',
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: size.iScreen(1.5),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0XFF963594),
                                border:
                                    Border.all(width: 1.5, color: Colors.white),
                                borderRadius: BorderRadius.circular(20.0)),
                            width: size.wScreen(30.0),
                            height: size.iScreen(4.0),
                            child: FlatButton(
                              splashColor: Colors.transparent,
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.iScreen(2.0)),
                              onPressed: () {
                                Navigator.pushNamed(context, 'login');
                              },
                              child: Text(
                                'Siguente',
                                style: GoogleFonts.roboto(
                                  fontSize: size.iScreen(1.9),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
