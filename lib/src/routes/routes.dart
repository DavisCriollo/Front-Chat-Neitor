

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neitorvet/src/pages/acercaDe_page.dart';
import 'package:neitorvet/src/pages/usuarios_page.dart';
import 'package:neitorvet/src/pages/citas_page.dart';
import 'package:neitorvet/src/pages/compras_page.dart';
import 'package:neitorvet/src/pages/facturas_page.dart';
import 'package:neitorvet/src/pages/home_page.dart';
import 'package:neitorvet/src/pages/login_page.dart';
import 'package:neitorvet/src/pages/mascotas_page.dart';
import 'package:neitorvet/src/pages/perfilUser_page.dart';
import 'package:neitorvet/src/pages/splash_page.dart';

final pagesRoute = <_Routes>[
  _Routes(FontAwesomeIcons.addressBook, 'Agendar Cita', SolicitarCitaPage()),
  _Routes(FontAwesomeIcons.paw, 'Mis Mascotas', MisMascotasPage()),
  _Routes(FontAwesomeIcons.cartPlus, 'Compras', ComprasPage()),
  _Routes(FontAwesomeIcons.fileInvoiceDollar, 'Mis Facturas', ListaFacturasPage()),
  _Routes(FontAwesomeIcons.commentAlt, 'Chat', UsuariosPage()),
  
];

class _Routes {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Routes(this.icon, this.titulo, this.page);
}


final Map<String, Widget Function(BuildContext)> appRoutes = {
  'home': (_) => HomePage(),
  'login': (_) => LoginPage(),
  // 'restaurarPass': (_) => ContrasenaPage(),
  // 'contactos': (_) => CantactosPage(),
  // 'materiaDetalle': (_) => NotasMateriaPage(),
  'miperfil': (_) => PerfilPage(),
  'splash': (_) => SplashPage(),
  'acercade': (_) => AcercaDePage(),
};
