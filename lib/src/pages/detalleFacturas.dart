
import 'package:flutter/material.dart';
import 'package:neitorvet/src/utils/responsive.dart';

class DetalleFacturaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final facturaData = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('# $facturaData'),
      ),
      body: Center(
        child: ItemFactura(
          data: facturaData,
        ),
      ),
    );
  }
}

class ItemFactura extends StatelessWidget {
  final data;

  ItemFactura({@required this.data});
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(
          horizontal: size.iScreen(2.0), vertical: size.iScreen(1.0)),
      padding: EdgeInsets.all(size.iScreen(2.0)),
      width: size.wScreen(100.0),
      height: size.hScreen(44.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)), // color: Colors.red,

        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(2, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: size.wScreen(100.0),
            padding: EdgeInsets.all(size.iScreen(2.0)),
            // color: Colors.red,
            child: Text('DETALLE DE FACTURA',
                style: TextStyle(
                  fontSize: size.iScreen(2.0),
                  fontWeight: FontWeight.bold,
                )),
          ),
          Row(
            children: [
              Text('Factur # : ',
                  style: TextStyle(fontSize: size.iScreen(2.0))),
              Text('$data',
                  style: TextStyle(
                      fontSize: size.iScreen(2.0),
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            children: [
              Text('Autorizacion : ',
                  style: TextStyle(fontSize: size.iScreen(2.0))),
              Container(
                width: size.wScreen(50.0),
                // color: Colors.red,
                child: Text('200004050010010000765340117165279710010212345678',
                    style: TextStyle(
                        fontSize: size.iScreen(2.0),
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Row(
            children: [
              Text('Fecha: ', style: TextStyle(fontSize: size.iScreen(2.0))),
              Text('09/09/2020',
                  style: TextStyle(
                      fontSize: size.iScreen(2.0),
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            children: [
              Text('Valor : ', style: TextStyle(fontSize: size.iScreen(2.0))),
              Text('\$125.00',
                  style: TextStyle(
                      fontSize: size.iScreen(2.0),
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            children: [
              Text('Fotma de Pago : ',
                  style: TextStyle(fontSize: size.iScreen(2.0))),
              Text('Efectivo',
                  style: TextStyle(
                      fontSize: size.iScreen(2.0),
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Container(
            width: size.wScreen(100.0),
            padding: EdgeInsets.only(
                top: size.iScreen(2.0),
                left: size.iScreen(2.0),
                right: size.iScreen(2.0)),

            // color: Colors.red,
            child: Text('Puedes descargar tu factura:',
                style: TextStyle(
                  fontSize: size.iScreen(2.0),
                  fontWeight: FontWeight.normal,
                )),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: size.iScreen(1.0),
                  ),
                  alignment: Alignment.center,
                  width: size.iScreen(5.0),
                  height: size.iScreen(5.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red,width: 2.0),
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'PDF',
                    style: TextStyle(
                        fontSize: size.iScreen(1.8),
                        fontWeight: FontWeight.bold,color:Colors.red),
                  ),
                ),
                 Container(
                  margin: EdgeInsets.only(
                    top: size.iScreen(1.0),
                  ),
                  alignment: Alignment.center,
                  width: size.iScreen(5.0),
                  height: size.iScreen(5.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey,width: 2.0),
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'XML',
                    style: TextStyle(
                        fontSize: size.iScreen(1.8),
                        fontWeight: FontWeight.bold,color:Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
