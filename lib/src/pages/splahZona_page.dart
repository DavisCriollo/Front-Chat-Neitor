
import 'package:flutter/material.dart';
import 'package:neitorvet/src/pages/login_page.dart';
import 'package:neitorvet/src/utils/responsive.dart';
import 'package:neitorvet/src/widget/buttomCustom.dart';
import 'package:neitorvet/src/widget/dropDounMenu.dart';

class SplashZonaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    print('BUILD');
    final List data = ['UNO', 'DOS', 'TRES', 'CUATRO', 'CINCO', 'SEIS'];
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  top: size.iScreen(2.0),
                  left: size.iScreen(2.0),
                  right: size.iScreen(2.0),
                  bottom: size.iScreen(3.0)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.iScreen(2.0)),
                border: Border.all(color: Color(0xFFab47bc), width: 0.2),
              ),
              padding: EdgeInsets.all(size.iScreen(2.0)),
              child: Text(
                'Bienvenid@ , para comenzar a disfrutar de nuestros servicio debes seleccionar la información solicitada',
                style: TextStyle(
                  fontSize: size.iScreen(2.5),
                  color: Color(0xFFab47bc),
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            DropMenu(
              title: 'Seleccione Zona',
              data: data,
              hinText: 'Zona',
            ),
            DropMenu(
              title: 'Seleccione Empresa',
              data: data,
               hinText: 'Empresa',
            ),
            SizedBox(
              height: 20.0,
            ),
            BottonCustom(
              title: 'Siguiente',
              child: LoginPage(),
            )
          ],
        ),
      ),
    );
  }
}
