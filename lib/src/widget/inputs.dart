
import 'package:flutter/material.dart';
import 'package:neitorvet/src/utils/responsive.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputsText extends StatelessWidget {
  final Responsive size;
  final String label, hintsText;
  final int maxLines;
  final IconData suffix;
  final TextInputType keyboardType;
  final TextEditingController textColtroller;

  final bool obscureText;
  InputsText({
    @required this.size,
    this.label,
    @required this.obscureText,
    @required this.keyboardType,
    this.suffix,
    this.hintsText,
    this.maxLines=1,
     this.textColtroller,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.wScreen(100),
      // margin: EdgeInsets.only(top: size.iScreen(1.5)),
      child: TextField(
        controller: this.textColtroller,
        maxLines:(this.maxLines>1)?this.maxLines:1,
        enableInteractiveSelection: false,
        keyboardType: this.keyboardType,
        obscureText: this.obscureText,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          isDense: true,
          hintText: this.hintsText,
          focusedBorder: InputBorder.none,
            border: InputBorder.none,
          suffixIcon: Icon(this.suffix),
          labelText: this.label,
          labelStyle: TextStyle(fontSize: size.iScreen(1.5)),
        ),
      ),
    );
  }
}
