
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neitorvet/src/utils/responsive.dart';
import 'package:neitorvet/src/widget/datePicker.dart';
import 'package:neitorvet/src/widget/dropDownCita.dart';
import 'package:neitorvet/src/widget/timePicker.dart';

class SolicitarCitaPage extends StatelessWidget {
  final List data = ['UNO', 'DOS', 'TRES', 'CUATRO', 'CINCO', 'SEIS'];

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Solicitar Cita'),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            DropMenuCita(
              title: 'Seleccione Mascota',
              hinText: 'Mascota',
              data: data,
              iconEnabledColor: Colors.black,
              color: Colors.black,
              textAlign: TextAlign.left,
            ),
            Container(
              // color: Colors.red,
              width: size.wScreen(85.0),
              margin: EdgeInsets.only(bottom: size.iScreen(2.0)),
              child: TextField(
                maxLines: 1,
                enableInteractiveSelection: false,
                keyboardType: TextInputType.text,
                // obscureText: this.obscureText,
                // textAlign: TextAlign.left,
                decoration: InputDecoration(
                  labelText: 'Ingrese nombre de Mascota',
                  suffixIcon: Icon(
                    FontAwesomeIcons.paw,
                    color: Color(0xFF971B81),
                  ),
                ),
              ),
            ),
            DropMenuCita(
              title: 'Seleccione Raza',
              hinText: 'Raza',
              data: data,
              iconEnabledColor: Colors.black,
              color: Colors.black,
              textAlign: TextAlign.left,
            ),
            DropMenuCita(
              title: 'Seleccione Cita',
              hinText: 'Cita',
              data: data,
              iconEnabledColor: Colors.black,
              color: Colors.black,
              textAlign: TextAlign.left,
            ),
            DropMenuCita(
              title: 'Seleccione Médico',
              hinText: 'Médico',
              data: data,
              iconEnabledColor: Colors.black,
              color: Colors.black,
              textAlign: TextAlign.left,
            ),
            Container(
              // color: Colors.red,
              width: size.wScreen(100),
              child: Row(
                children: [
                  Container(
                    width: size.wScreen(50.0),
                    child: InputDataPiker(
                      // size: size,
                      label: 'Fecha de cita',
                      suffix: FontAwesomeIcons.calendarAlt,
                    ),
                  ),
                  Container(
                    width: size.wScreen(50.0),
                    child: InputTimePiker(
                      size: size,
                      label: 'Hora de cita',
                      suffix: FontAwesomeIcons.clock,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: size.wScreen(100.0),
              padding: EdgeInsets.symmetric(
                horizontal: size.wScreen(5.0),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: size.iScreen(2.0), bottom: size.iScreen(2.0)),
                    width: size.wScreen(100.0),
                    // color: Colors.red,
                    child: Text(
                      'Observaciones:',
                      style: GoogleFonts.roboto(
                        fontSize: size.iScreen(1.9),
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  TextField(
                    maxLines: 4,
                    enableInteractiveSelection: false,
                    keyboardType: TextInputType.text,
                    // obscureText: this.obscureText,
                    // textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                            width: 1,
                          )),
                      hintText: 'Ingrese Observación',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
