import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neitorvet/src/utils/responsive.dart';

class BtnLogin extends StatelessWidget {
  final Function onpressed;

  const BtnLogin({
    Key key,
    @required this.size,
    @required this.onpressed,
  }) : super(key: key);

  final Responsive size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0XFF963594),
            border: Border.all(width: 1.5, color: Colors.white),
            borderRadius: BorderRadius.circular(8.0)),
        width: size.wScreen(100.0),
        height: size.iScreen(5.5),
        child: FlatButton(
          splashColor: Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: size.iScreen(2.0)),
          onPressed: this.onpressed,
          child: Text(
            'Ingresar',
            style: GoogleFonts.roboto(
              fontSize: size.iScreen(2.5),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
