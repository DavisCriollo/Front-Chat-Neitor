import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neitorvet/src/models/mensajes_response.dart';

import 'package:neitorvet/src/services/auth_service.dart';
import 'package:neitorvet/src/services/chat_service.dart';
import 'package:neitorvet/src/services/socket_service.dart';
import 'package:neitorvet/src/utils/responsive.dart';
import 'package:neitorvet/src/widget/mensaje_chat.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  ChatService chatService;
  SocketService socketService;
  AuthService authService;

  final _inputTextChat = new TextEditingController();

  final _focusNode = new FocusNode();
  bool _estaEscribiendo = false;
  List<ChatMessage> _message = [
// ChatMessage(uid: '123',texto: 'Hola Como estas'),
  ];

  @override
  void initState() {
    super.initState();

    this.chatService = Provider.of<ChatService>(context, listen: false);
    this.socketService = Provider.of<SocketService>(context, listen: false);
    this.authService = Provider.of<AuthService>(context, listen: false);

    this.socketService.socket.on('mensaje-personal', escucharMensaje);

    _cargarHistorial(this.chatService.usuarioPara.uid);
  }

  void _cargarHistorial(String usuarioID) async {
    List<Mensaje> chat = await this.chatService.getChat(usuarioID);
    final historial = chat.map((msj) => new ChatMessage(
          texto: msj.mensaje,
          uid: msj.de,
          animationController: AnimationController(
              vsync: this, duration: Duration(milliseconds: 300))
            ..forward(),
        ));

    setState(() {
      _message.insertAll(0, historial);
    });
  }

  void escucharMensaje(dynamic payload) {
    // print('Tengo Mensaje $data');
    ChatMessage message = new ChatMessage(
      texto: payload['mensaje'],
      uid: payload['de'],
      animationController: AnimationController(
          vsync: this, duration: Duration(milliseconds: 300)),
    );

    setState(() {
      _message.insert(0, message);
    });

    message.animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final chatService = Provider.of<ChatService>(context);
    final usuarioPara = chatService.usuarioPara;
    final Responsive size = Responsive.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // backgroundColor: Colors.white,
        // backgroundColor: Color(0xFF0092D0),
        elevation: 1,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Color(0xFF0092D0),
              child: Text(
                usuarioPara.nombre.substring(0, 1),
                //  'David'.substring(0, 1),
                style: GoogleFonts.roboto(
                    fontSize: size.iScreen(1.7),
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: size.iScreen(2.0)),
              child: Text(usuarioPara.nombre,
                  // child: Text('David criollo',
                  style: GoogleFonts.roboto(
                      fontSize: size.iScreen(1.8),
                      fontWeight: FontWeight.normal,
                      color: Colors.white)),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          // border: Border.all( width: 2),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _message.length,
                itemBuilder: (_, i) => _message[i],
                reverse: true,
              ),
            ),
            // Divider(height: 5),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(
                  // color: Color(0xFF0092D0),
                  color: Color(0xFF963594),
                  // width: 3.0 --> you can set a custom width too!
                ),
              )),
              margin: EdgeInsets.only(top: size.iScreen(0.5)),
              child: _inputChat(size),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputChat(Responsive size) {
    return SafeArea(
      child: Container(
        // decoration: BoxDecoration(
        //   border:Border.all()
        // ),
        margin:
            EdgeInsets.only(left: size.iScreen(2.0), right: size.iScreen(0.5)),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLength: null,
                maxLines: null,
                controller: _inputTextChat,
                textInputAction: TextInputAction.send,
                onSubmitted: _onSubmit,
                onChanged: (String texto) {
                  setState(() {
                    if (texto.trim().length > 0) {
                      _estaEscribiendo = true;
                    } else {
                      _estaEscribiendo = false;
                    }
                  });
                },
                decoration: InputDecoration.collapsed(
                  hintText: 'Escribir Mensaje',
                ),
                focusNode: _focusNode,
              ),
            ),
            Container(
              // color: Colors.red,
              margin: EdgeInsets.symmetric(horizontal: size.iScreen(0)),
              child: Platform.isIOS
                  ? CupertinoButton(
                      child: Text('Enviar'),
                      onPressed: _estaEscribiendo
                          ? () => _onSubmit(_inputTextChat.text.trim())
                          : null,
                    )
                  : Container(
                      child: IconTheme(
                      data: IconThemeData(color: Color(0xFF963594)),
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        icon: Icon(
                          Icons.send,
                        ),
                        onPressed: _estaEscribiendo
                            ? () => _onSubmit(_inputTextChat.text.trim())
                            : null,
                      ),
                    )),
            ),
          ],
        ),
      ),
    );
  }

  _onSubmit(String texto) {
    // print(texto);
    if (texto.length > 0) {
      _inputTextChat.clear();
      _focusNode.requestFocus();
      final _newMessage = new ChatMessage(
        uid: authService.usuario.uid,
        texto: texto,
        animationController: AnimationController(
            vsync: this, duration: Duration(milliseconds: 300)),
      );
      _message.insert(0, _newMessage);
      _newMessage.animationController.forward();
      setState(() {
        _estaEscribiendo = false;
      });

      this.socketService.emit('mensaje-personal', {
        'de': this.authService.usuario.uid,
        'para': this.chatService.usuarioPara.uid,
        'mensaje': texto
      });
    }
  }

  @override
  void dispose() {
    for (ChatMessage messaje in _message) {
      messaje.animationController.dispose();
    }
    // DESCONESTO EL LISTEN DEL MENSAJE CUANDO EL USUARIO NO ESTA CONECTADO
    this.socketService.socket.off('mensaje-personal');
    super.dispose();
  }
}
