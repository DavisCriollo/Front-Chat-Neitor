
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:neitorvet/src/utils/responsive.dart';

class InputDataPiker extends StatefulWidget {
  final String label, hintsText;
  final IconData suffix;
  final TextInputType keyboardType;
  InputDataPiker({
    // @required this.size,
    @required this.label,
    this.hintsText,
    this.suffix,
    this.keyboardType,
  });

  // final Responsive size;

  @override
  _InputDataPikerState createState() => _InputDataPikerState();
}

class _InputDataPikerState extends State<InputDataPiker> {
  TextEditingController dateController = new TextEditingController();
  @override
  void dispose() {
     dateController.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.iScreen(2.0)),
      width: size.wScreen(100.0),
      child: TextField(
        controller: dateController,
        enableInteractiveSelection: false,
        keyboardType: this.widget.keyboardType,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: this.widget.hintsText,
          suffixIcon: Icon(this.widget.suffix),
          labelText: this.widget.label,
          labelStyle: TextStyle(fontSize: size.iScreen(2.0)),
        ),
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        },
      ),
    );
  }

  void _selectDate(context) async {
    DateTime _picker = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime.now(),
      lastDate: DateTime(2025),
      locale: Locale('es', 'ES'),
    );

    if (_picker != null) {
      setState(() {
        // _fecha = _picker.toString();
        //  final DateTime now = DateTime.now();
        final DateTime now = _picker;
        final DateFormat formatter = DateFormat('yyyy-MM-dd');
        final String formatted = formatter.format(now);
        dateController.text = formatted;
        // print(_fecha);
        print(formatted); // something like 2013-04-20
      });
    }
  }

  



}
