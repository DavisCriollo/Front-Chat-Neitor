import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neitorvet/src/models/usuario.dart';
import 'package:neitorvet/src/services/chat_service.dart';
// import 'package:neitorvet/src/services/auth_service.dart';
import 'package:neitorvet/src/services/socket_service.dart';
import 'package:neitorvet/src/services/usuarios_service.dart';
import 'package:neitorvet/src/utils/responsive.dart';
import 'package:provider/provider.dart';

class UsuariosPage extends StatefulWidget {
  @override
  _UsuariosPageState createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  final usuarioService = new UsuariosService();

  List<Usuario> usuariosBDD = [];
  // final usuarios = [
  // Usuario(uid: '1', nombre: 'David', onLine: true, correo: 'correo@correo.com'),
  // Usuario(uid: '2', nombre: 'Juan', onLine: false, correo: 'correo@correo.com'),
  // Usuario(
  //     uid: '3', nombre: 'Dario', onLine: false, correo: 'correo@correo.com'),
  // Usuario(
  //     uid: '4', nombre: 'Nancy', onLine: false, correo: 'correo@correo.com'),
  // Usuario(
  //     uid: '5', nombre: 'Lorena', onLine: true, correo: 'correo@correo.com'),
  // Usuario(
  //     uid: '6', nombre: 'Jonathan', onLine: true, correo: 'correo@correo.com'),
  // ];

  @override
  void initState() {
    _cargarUsuarios();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);
    final Responsive size = Responsive.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Chat'),
        actions: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: size.iScreen(2.0)),
              child: (socketService.serverStatus == ServerStatus.Online)
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.white,
                    )
                  : Icon(
                      Icons.offline_bolt,
                      color: Colors.red,
                    )),
        ],
      ),
      body: _listViewUsuarios(size),
    );
  }

  ListView _listViewUsuarios(Responsive size) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: usuariosBDD.length,
      separatorBuilder: (_, i) => Divider(
        color: Color(0xFF0092D0),
      ),
      itemBuilder: (_, i) => _usuarioListTile(usuariosBDD[i], size),
    );
  }

  ListTile _usuarioListTile(Usuario usuario, Responsive size) {
    return ListTile(
        leading: CircleAvatar(
          backgroundColor: Color(0xFF963594),
          child: Text(
            usuario.nombre.substring(0, 1),
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
        subtitle: Text('${usuario.email}',
            style: GoogleFonts.roboto(
              fontSize: size.iScreen(1.7),
            )),
        trailing: Container(
          width: size.iScreen(1.5),
          height: size.iScreen(1.5),
          decoration: BoxDecoration(
              color: usuario.online ? Colors.green[800] : Colors.red[900],
              borderRadius: BorderRadius.circular(100)),
        ),
        onTap: () {
          final chatService = Provider.of<ChatService>(context, listen: false);
          chatService.usuarioPara = usuario;
          Navigator.pushNamed(context, 'chat');
        });
  }

  _cargarUsuarios() async {
    this.usuariosBDD = await usuarioService.getUsuarios();
    setState(() {});
  }
}
