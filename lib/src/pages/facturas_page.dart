
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neitorvet/src/pages/detalleFacturas.dart';
import 'package:neitorvet/src/utils/responsive.dart';

class ListaFacturasPage extends StatelessWidget {
  final List<String> facturas = [
    '001-001-000076534',
    '001-001-1231231230',
    '001-001-9875445456',
    '001-001-5623423465',
    '001-001-6509803545',
    '001-001-2347525246',
    '001-001-1775788742',
    '001-001-7822452452',
    '001-001-7857824500',
    '001-001-4151451754',
    '001-001-8715851785',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis Facturas'),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: facturas.length,
        itemBuilder: (BuildContext context, int index) {
          final factura = facturas[index];
          return ItemsFacturas(factura: factura);
        },
      ),
    );
  }
}

class ItemsFacturas extends StatelessWidget {
  ItemsFacturas({
    @required this.factura,
  });

  final String factura;

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => DetalleFacturaPage(),
            settings: RouteSettings(arguments: factura),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: size.iScreen(2.0), vertical: size.iScreen(1.0)),
        padding: EdgeInsets.all(size.iScreen(2.0)),
        width: size.wScreen(100.0),
        // height: size.hScreen(11.0),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: size.wScreen(50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // color: Colors.red,
                    width: size.wScreen(100.0),
                    child: Text(
                      '# $factura',
                      // overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: size.iScreen(2.2),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    '2000/04/05',
                    style: TextStyle(
                        fontSize: size.iScreen(2),
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            Text(
              '\$1254.00',
              style: TextStyle(
                  fontSize: size.iScreen(2.1), fontWeight: FontWeight.bold),
            ),
            Icon(
              FontAwesomeIcons.chevronRight,
              size: size.iScreen(2.0),
            )
          ],
        ),
      ),
    );
  }
}
