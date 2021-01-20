import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neitorvet/src/models/usuario.dart';
import 'package:neitorvet/src/utils/responsive.dart';

class UsuariosPage extends StatefulWidget {
  @override
  _UsuariosPageState createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  final usuarios = [
    Usuario(uid: 1, nombre: 'David', onLine: true, correo: 'correo@correo.com'),
    Usuario(uid: 2, nombre: 'Juan', onLine: false, correo: 'correo@correo.com'),
    Usuario(
        uid: 3, nombre: 'Dario', onLine: false, correo: 'correo@correo.com'),
    Usuario(
        uid: 4, nombre: 'Nancy', onLine: false, correo: 'correo@correo.com'),
    Usuario(
        uid: 5, nombre: 'Lorena', onLine: true, correo: 'correo@correo.com'),
    Usuario(
        uid: 6, nombre: 'Jonathan', onLine: true, correo: 'correo@correo.com'),
  ];

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Mi Chat'),
        ),
        body: _listViewUsuarios(size));
  }

  ListView _listViewUsuarios(Responsive size) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: usuarios.length,
      separatorBuilder: (_, i) => Divider(
        color: Color(0xFF0092D0),
      ),
      itemBuilder: (_, i) => _usuarioListTile(usuarios[i], size),
    );
  }

  ListTile _usuarioListTile(Usuario usuario, Responsive size) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Color(0xFF963594),
        child: Text(
          usuario.nombre.substring(0, 2),
          style: GoogleFonts.roboto(
              fontSize: size.iScreen(1.7),
              fontWeight: FontWeight.normal,
              color: Colors.white),
        ),
      ),
      title: Text(usuario.nombre,
          style: GoogleFonts.roboto(
            fontSize: size.iScreen(2),
          )),
      subtitle: Text('${usuario.correo}',
          style: GoogleFonts.roboto(
            fontSize: size.iScreen(1.7),
          )),
      trailing: Container(
        width: size.iScreen(1.5),
        height: size.iScreen(1.5),
        decoration: BoxDecoration(
            color: usuario.onLine ? Colors.green[800] : Colors.red[900],
            borderRadius: BorderRadius.circular(100)),
      ),
    );
  }
}
