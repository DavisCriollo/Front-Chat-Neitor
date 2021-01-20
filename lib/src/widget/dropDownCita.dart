
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neitorvet/src/utils/responsive.dart';


class DropMenuCita extends StatelessWidget {
  // final List data = ['UNO', 'DOS', 'TRES', 'CUATRO', 'CINCO', 'SEIS'];
  
  final List data;
  final Color color;
  final Color iconEnabledColor;
  final String title, hinText;
  final  TextAlign  textAlign;

  const DropMenuCita({
    @required this.data,
    @required this.title,
    this.hinText,
    this.color, 
    this.iconEnabledColor, @required this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    // final zona = Provider.of<MenuDropDownProvider>(context, listen: true);
    List<DropdownMenuItem<String>> getOptions() {
      List<DropdownMenuItem<String>> menu = new List();
      data.forEach((item) {
        menu.add(DropdownMenuItem(
          child: Text(item),
          value: item,
        ));
      });
      return menu;
    }

    return Container(
      // color: Colors.red,
      padding: EdgeInsets.symmetric(
          horizontal: size.iScreen(2.0), vertical: size.iScreen(1.0),
          ),
      width: double.infinity,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Text(
              this.title,
              style: GoogleFonts.roboto(
                fontSize: size.iScreen(1.9),
                fontWeight: FontWeight.bold,
                color: this.color,
              ),
            ),
          ),
          Container(
            color: Colors.white.withOpacity(0.15),
            padding: EdgeInsets.only(left: size.iScreen(2.0)),
            alignment: Alignment.center,
            child: DropdownButton(
              iconEnabledColor: this.iconEnabledColor,
              iconSize: size.iScreen(3.0),
              dropdownColor: Color(0xFF0092D0),
              isExpanded: true,
              hint: Text(
                this.hinText,
                style: GoogleFonts.roboto(
                  fontSize: size.iScreen(2.0),
                  fontWeight: FontWeight.normal,
                  color: this.color,
                ),
                textAlign:this.textAlign,
              ),
              value: null,//zona.getZona,
               style: GoogleFonts.roboto(
                  fontSize: size.iScreen(2.0),
                  fontWeight: FontWeight.normal,
                  color: this.color,
                ),
              items: getOptions(),
              onChanged: (value) {
                // final zonas =
                //     Provider.of<MenuDropDownProvider>(context, listen: false)
                //         .setZona = value;
                // print(zonas);
              },
            ),
          ),
        ],
      ),
    );
  }
}
