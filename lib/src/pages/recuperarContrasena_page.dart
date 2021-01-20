
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neitorvet/src/pages/login_page.dart';
import 'package:neitorvet/src/utils/responsive.dart';
import 'package:neitorvet/src/widget/inputs.dart';

class RecuperarContrasenaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);

    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: size.iScreen(3),
            vertical: size.iScreen(3.0),
          ),
          // padding: EdgeInsets.symmetric(horizontal: size.iScreen(1.0)),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFab47bc), width: 1.0),
          ),
          //  color: Colors.red,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: size.iScreen(1.0)),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF9c27b0),
                  // border: Border(
                  //   bottom: BorderSide(color: Color(0xFF9c27b0), width: 5),
                  // ),
                ),
                child: Text(
                  'Recuperar Contraseña',
                  style: TextStyle(
                    fontSize: size.iScreen(2.5),
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: size.iScreen(2.0),
                  vertical: size.iScreen(2.0),
                ),
                child: Text(
                  'Escribe tu dirección de correo electrónico o usuario para comenzar el proceso de restablecimiento.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: size.iScreen(2.3),
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: size.iScreen(2.0),
                  vertical: size.iScreen(1.0),
                ),
                child: InputsText(
                  size: size,
                  label: 'Correo',
                  hintsText: 'correo@empresa.com',
                  suffix: FontAwesomeIcons.envelope,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: size.iScreen(2.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: size.iScreen(13.0),
                      height: size.iScreen(4),
                      child: FlatButton(
                        onPressed: () {},
                        child: Text(
                          'Enviar',
                          style: TextStyle(
                            fontSize: size.iScreen(2.3),
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                            color: Color(0xFF9c27b0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: size.iScreen(13.0),
                      height: size.iScreen(4),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => LoginPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Salir',
                          style: TextStyle(
                            fontSize: size.iScreen(2.4),
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                            color: Color(0xFF9c27b0),
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
      ),
    );
  }
}
