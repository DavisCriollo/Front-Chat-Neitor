
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neitorvet/src/utils/responsive.dart';

class ContactenosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Contáctenos'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _LogoEmpresa(),
          SizedBox(
            height: size.hScreen(3.0),
          ),
          _InfoEmpresa(),
          SizedBox(
            height: size.hScreen(3.0),
          ),
          _RedesSociales(),
        ],
      ),
    );
  }
}

class _RedesSociales extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    return Container(
      margin: EdgeInsets.only(top: size.iScreen(3.0)),
      child: Column(
        children: [
          Text(
            ' Visita nuestra Web',
            style: TextStyle(fontSize: size.iScreen(2.0), color: Colors.grey),
          ),
          SizedBox(height: size.iScreen(2.0),),
          _ItemsInfo(
            color: Color(0xFF1773EA),
              icon: FontAwesomeIcons.globe, info: 'https://www.empresa.com.ec'),
          _BotonSocial(),
        ],
      ),
    );
  }
}

class _BotonSocial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.iScreen(3.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Boton(
              size: size,
              color: Color(0xFFD6324A),
              icon: FontAwesomeIcons.instagram),
          _Boton(
              size: size,
              color: Color(0xFF1773EA),
              icon: FontAwesomeIcons.facebookF),
          _Boton(
              size: size,
              color: Color(0xFF1C9CEA),
              icon: FontAwesomeIcons.twitter),
        ],
      ),
    );
  }
}

class _Boton extends StatelessWidget {
  final Color color;
  final IconData icon;

  _Boton({
    @required this.size,
    @required this.color,
    @required this.icon,
  });

  final Responsive size;

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      margin: EdgeInsets.all(size.iScreen(1.0)),
      width: size.iScreen(6.0),
      height: size.iScreen(6.0),
      decoration: BoxDecoration(
          color: this.color, borderRadius: BorderRadius.circular(100)),
      child: IconButton(
        splashRadius: 15.0,
        icon: Icon(
          this.icon,
          color: Colors.white,size: size.iScreen(3.0),
        ),
        onPressed: () {},
      ),
    );
  }
}

class _InfoEmpresa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);

    return Container(
      child: Column(
        children: [
          _ItemsInfo(
            icon: FontAwesomeIcons.phoneAlt,
            info: '022 265 4565',
            color: Color(0xFF963494),
          ),
          SizedBox(
            height: size.iScreen(2.0),
          ),
          _ItemsInfo(
            icon: FontAwesomeIcons.mobileAlt,
            info: '098455456',
            color: Color(0xFF963494),
          ),
          SizedBox(
            height: size.iScreen(2.0),
          ),
          _ItemsInfo(
            icon: FontAwesomeIcons.envelope,
            info: 'info@empresa.com.ec',
            color: Color(0xFF963494),
          ),
          SizedBox(
            height: size.iScreen(2.0),
          ),
          _ItemsInfo(
            icon: FontAwesomeIcons.mapMarkerAlt,
            info: 'Av. 9 de Octubre y Rumichaca ',
            color: Color(0xFF963494),
          ),
        ],
      ),
    );
  }
}

class _ItemsInfo extends StatelessWidget {
  final IconData icon;
  final String info;
  final Color color;

  _ItemsInfo({
    this.icon,
    @required this.info,
    @required this.color,
  });
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.iScreen(5.0)),
      alignment: Alignment.center,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: size.iScreen(2.0)),
            child: Icon(
              this.icon,
              color: color,
            ),
          ),
          Expanded(
            child: Text(
              this.info,
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: size.iScreen(2.2), color: color),
            ),
          ),
        ],
      ),
    );
  }
}

class _LogoEmpresa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: size.iScreen(5.0), vertical: size.iScreen(3.0)),
      // color: Colors.red,
      width: size.wScreen(100),
      height: size.hScreen(10.0),
      child: Image.asset('assets/imgs/logo2.png'),
    );
  }
}
