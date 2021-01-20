
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neitorvet/src/utils/responsive.dart';
import 'package:neitorvet/src/widget/inputs.dart';

class PerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Perfil'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right:size.iScreen(2.0)),
            child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.save,
                  color: Colors.white,
                  size: size.iScreen(3),
                ),
                onPressed: null),
          )
        ],
      ),
      body: Column(
        children: [
          FotoUser(size: size),
          _InputsForm(size: size),
          SizedBox(
            height: size.iScreen(1.0),
          )
        ],
      ),
    );
  }
}

class _InputsForm extends StatelessWidget {
  const _InputsForm({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Responsive size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: size.wScreen(10.0)),
          child: Form(
            child: Column(
              children: [
                InputsText(
                  size: size,
                  label: 'Nombre',
                  suffix: FontAwesomeIcons.userTie,
                  obscureText: false,
                  keyboardType: null,
                ),
                InputsText(
                  size: size,
                  label: 'Dirección',
                  suffix: FontAwesomeIcons.mapMarkedAlt,
                  obscureText: false,
                  keyboardType: TextInputType.multiline,
                ),
                InputsText(
                  size: size,
                  label: 'Correo',
                  suffix: FontAwesomeIcons.envelope,
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                ),
                InputsText(
                  size: size,
                  label: 'Telefono',
                  suffix: FontAwesomeIcons.phoneAlt,
                  keyboardType: TextInputType.number,
                  obscureText: false,
                ),
                InputsText(
                  size: size,
                  label: 'Contraseña Actual',
                  suffix: FontAwesomeIcons.unlockAlt,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                InputsText(
                  size: size,
                  label: 'Nueva Contraseña',
                  suffix: FontAwesomeIcons.lock,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                InputsText(
                  size: size,
                  label: 'Confirmar Contraseña ',
                  suffix: FontAwesomeIcons.lock,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FotoUser extends StatelessWidget {
  const FotoUser({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Responsive size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: size.hScreen(1.2)),
      alignment: Alignment.center,
      // decoration: BoxDecoration(
      //   border: Border(bottom: BorderSide(color:Color(0xFF963494), ))
      // ),
      child: Column(
        children: [
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                border: Border.all(color: Color(0xFF04559D)),
              ),
              width: size.iScreen(12.0),
              height: size.iScreen(12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image(
                  image: AssetImage('assets/imgs/Me.jpg'),
                  // image: verificaImagen(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            onTap: () {
              // _muestraOpcionesImagen(context);
            },
          ),
          Padding(
            padding: EdgeInsets.all(size.iScreen(1.0)),
            child: Text('davis@gmail.com',style: TextStyle(fontSize: size.iScreen(1.5)),),
          ),
        ],
      ),
    );
  }
}
