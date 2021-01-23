import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neitorvet/src/services/auth_service.dart';
import 'package:neitorvet/src/services/socket_service.dart';

import 'package:neitorvet/src/utils/responsive.dart';
import 'package:provider/provider.dart';

class MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
      final socketService = Provider.of<SocketService>(context);
    final usuario = authService.usuario;
    final Responsive size = Responsive.of(context);
    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: size.iScreen(2.0)),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    // color: Colors.red,
                    // border: Border.all(color: Colors.blue),
                    ),
                width: size.wScreen(100),
                // height: size.wScreen(46.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(size.iScreen(0.5)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: Color(0xFF04559D),
                        ),
                      ),
                      width: size.iScreen(13),
                      height: size.iScreen(13),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image(
                          image: AssetImage('assets/imgs/Me.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      // color:Colors .red,
                      margin: EdgeInsets.only(top: size.iScreen(2.0)),
                      child: Text('${usuario.email}',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              fontSize: size.iScreen(2.0),
                              fontWeight: FontWeight.bold
                              // color: Colors.white,
                              )),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: _ListaOpciones(),
            ),
            ListTile(
              title: Text('Acerca de',
                  style: GoogleFonts.roboto(
                      fontSize: size.iScreen(2.0), fontWeight: FontWeight.bold
                      // color: Colors.white,
                      )),
              leading: Icon(FontAwesomeIcons.cog, color: Color(0xFF963494)),
              trailing: Icon(
                FontAwesomeIcons.chevronRight,
                size: size.iScreen(1.6),
              ),
              onTap: () {
               
              },
            ),
            ListTile(
              title: Text('Cerrar Sesión',
                  style: GoogleFonts.roboto(
                      fontSize: size.iScreen(2.0), fontWeight: FontWeight.bold
                      // color: Colors.white,
                      )),
              leading: Icon(FontAwesomeIcons.cog, color: Color(0xFF963494)),
              trailing: Icon(
                FontAwesomeIcons.chevronRight,
                size: size.iScreen(1.6),
              ),
              onTap: () {
             
               socketService.disconnect();
                Navigator.pushReplacementNamed(context, 'login');
                AuthService.deleteToken();
               
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);

    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        _ItemsMenu(
            icon: FontAwesomeIcons.addressBook,
            title: 'Agendar Cita',
            page: 'citas',
            size: size),
        _ItemsMenu(
            icon: FontAwesomeIcons.paw,
            title: 'Mis Mascotas',
            page: 'mascotas',
            size: size),
        _ItemsMenu(
            icon: FontAwesomeIcons.cartPlus,
            title: 'Compras',
            page: 'compras',
            size: size),
        _ItemsMenu(
            icon: FontAwesomeIcons.fileInvoiceDollar,
            title: 'Mis Facturas',
            page: 'facturas',
            size: size),
        _ItemsMenu(
            icon: FontAwesomeIcons.commentAlt,
            title: 'Chat',
            page: 'usuarios',
            size: size),
        _ItemsMenu(
            icon: FontAwesomeIcons.shareAlt,
            title: 'Compartir',
            page: 'login',
            size: size),
      ],
    );
  }
}

class _ItemsMenu extends StatelessWidget {
  final Responsive size;
  final String title;
  final IconData icon;
  final String page;
  _ItemsMenu({
    @required this.title,
    @required this.icon,
    @required this.page,
    @required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          dense: true,
          leading: Icon(
            this.icon,
            color: Color(0xFF963494),
          ),
          title: Text(
            this.title,
            style: GoogleFonts.roboto(
              fontSize: size.iScreen(2.0),
              color: Colors.black,
            ),
          ),
          trailing: FaIcon(
            FontAwesomeIcons.chevronRight,
            size: size.iScreen(2.2),
          ),
          onTap: () {
            Navigator.popAndPushNamed(context, this.page);
          },
        ),
        Divider(
          color: Theme.of(context).primaryColor,
        ),
      ],
    );
  }
}
