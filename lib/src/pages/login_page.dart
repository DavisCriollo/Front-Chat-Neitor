import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neitorvet/src/helpers/mostar_alerta.dart';
import 'package:neitorvet/src/pages/recuperarContrasena_page.dart';
import 'package:neitorvet/src/services/auth_service.dart';
import 'package:neitorvet/src/services/socket_service.dart';
import 'package:neitorvet/src/utils/responsive.dart';
import 'package:neitorvet/src/widget/boton_login.dart';
import 'package:neitorvet/src/widget/headers.dart';
import 'package:neitorvet/src/widget/inputs.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailControl = TextEditingController();
  final passwordControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    final authService = Provider.of<AuthService>(context);
    final socketService = Provider.of<SocketService>(context);
    return Scaffold(
      backgroundColor: Color(0xFFDEEAF6),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: size.wScreen(100),
              margin: EdgeInsets.only(bottom: size.iScreen(2.0)),
              height: size.hScreen(35),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Header(),
                  Center(
                    child: Container(
                      width: size.wScreen(50),
                      height: size.hScreen(50),
                      // color: Colors.red,
                      // padding: EdgeInsets.all(5.0),
                      child: Image.asset(
                        'assets/imgs/logoPetShop.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  height: size.hScreen(50.0),
                  color: Color(0xFFDEEAF6),
                  padding: EdgeInsets.symmetric(
                    horizontal: size.wScreen(10.0),
                  ),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin:
                              EdgeInsets.symmetric(vertical: size.iScreen(1.0)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6.0),
                            child: Container(
                              height: size.iScreen(5.5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.50, color: Colors.black87),
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF22398E),
                                      border: Border.all(
                                          width: 0.5, color: Color(0xFF22398E)),
                                    ),
                                    width: size.iScreen(5.5),
                                    height: size.iScreen(5.5),
                                    child: Icon(
                                      FontAwesomeIcons.userTie,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.iScreen(0.5)),
                                      child: InputsText(
                                        textColtroller: emailControl,
                                        size: size,
                                        hintsText: ' Correo',
                                        obscureText: false,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(vertical: size.iScreen(1.0)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6.0),
                            child: Container(
                              height: size.iScreen(5.5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.50, color: Colors.black87),
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: size.iScreen(5.5),
                                    height: size.iScreen(5.5),
                                    color: Color(0xFF22398E),
                                    child: Icon(
                                      FontAwesomeIcons.lock,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.iScreen(0.5)),
                                      child: InputsText(
                                        size: size,
                                        textColtroller: passwordControl,
                                        hintsText: ' Contraseña',
                                        obscureText: true,
                                        keyboardType: TextInputType.text,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.iScreen(2.0)),
                        BtnLogin(
                          size: size,
                          onpressed:  () async {
                                FocusScope.of(context).unfocus();
                                  final loginOk= await authService.login(emailControl.text.trim(),
                                      passwordControl.text.trim());
                                  emailControl.text = "";
                                  passwordControl.text = "";

                                  if(loginOk)
                                  {
                                    socketService.connect();
                                  Navigator.pushReplacementNamed(context, 'home');
                                    
                                  }
                                  else
                                  {
                                    mostarAlerta(context,'Login Incorrecto','Revise sus credenciales');
                                  }
                                },
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: size.iScreen(2.0),
                              bottom: size.iScreen(8.0)),
                          alignment: Alignment.centerRight,
                          width: size.wScreen(100),
                          padding: EdgeInsets.symmetric(vertical: 4.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => FadeIn(
                                        duration: Duration(seconds: 2),
                                        child: RecuperarContrasenaPage()),
                                  ));
                            },
                            child: Text(
                              'Olvidé contraseña',
                              style: GoogleFonts.roboto(
                                fontSize: size.iScreen(2.0),
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0XFF0092D0),
                                border:
                                    Border.all(width: 1.5, color: Colors.white),
                                borderRadius: BorderRadius.circular(10.0)),
                            width: size.wScreen(60.0),
                            height: size.iScreen(5.05),
                            child: FlatButton(
                              splashColor: Colors.transparent,
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.iScreen(1.0)),
                              onPressed: () {},
                              child: Text(
                                'Seleccionar otra Veterinaria',
                                style: GoogleFonts.roboto(
                                  fontSize: size.iScreen(1.8),
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
