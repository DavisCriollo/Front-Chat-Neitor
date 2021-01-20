import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neitorvet/src/utils/responsive.dart';
import 'package:neitorvet/src/widget/elementosHome.dart';
import 'package:neitorvet/src/widget/menu_Drower.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '',
          style: GoogleFonts.roboto(
              fontSize: size.iScreen(3), fontWeight: FontWeight.bold),
        ),
      ),
      // drawer: MenuHome(),
      drawer: MenuPrincipal(),
      body: Container(
        width: size.wScreen(100),
        height: size.hScreen(100),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              // Color(0xFF963594).withOpacity(0.4),
              Color(0xFF0092D0).withOpacity(0.5),
              Color(0xFF0092D0).withOpacity(0.3),
            ],
            stops: [0.1, 0.6],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: size.wScreen(50),
                  // height: size.hScreen(50),
                  // color: Colors.red,
                  // padding: EdgeInsets.all(5.0),
                  child: Image.asset(
                    'assets/imgs/logoPetShop.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                // color: Colors.red,
                //  width: size.wScreen(50),
                //   height: size.hScreen(50),
                padding: EdgeInsets.symmetric(horizontal: size.iScreen(1.5)),
                child: Wrap(
                  children: [
                    ElementosHome(
                      size: size,
                      image: 'assets/imgs/icon-cita.png',
                      label: 'AGENDAR CITAS',
                      onTap: () => Navigator.pushNamed(context, 'citas'),
                    ),
                    ElementosHome(
                      size: size,
                      image: 'assets/imgs/icon-mascota.png',
                      label: 'VER MASCOTAS',
                      onTap: () => Navigator.pushNamed(context, 'mascotas'),
                    ),
                    ElementosHome(
                      size: size,
                      image: 'assets/imgs/icon-carrito.png',
                      label: 'COMPRAS',
                      onTap: () => Navigator.pushNamed(context, 'compras'),
                    ),
                    ElementosHome(
                      size: size,
                      image: 'assets/imgs/icon-factura.png',
                      label: 'MIS FACTURAS',
                      onTap: () => Navigator.pushNamed(context, 'facturas'),
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

// COLORES DE LA APLICACION
//  Morado Intenso Boton Ingresar: #963594
//  Azul  Intenso Iconos Login: #22398E
//  Azul  Boton Seleccionar Veterinaria: #0092D0
