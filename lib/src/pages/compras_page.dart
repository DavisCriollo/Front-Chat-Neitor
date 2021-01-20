
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neitorvet/src/pages/detalleProductoCarrito.dart';
import 'package:neitorvet/src/pages/listaProductosCarrito.dart';
import 'package:neitorvet/src/utils/responsive.dart';

class ComprasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    List<String> categorias = [
      'Alimentos',
      'Accesorios',
      'Juguetes',
      'Vacunas',
      'Peluqueria',
      'Medicina',
      'Tratamientos',
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text('Nuestros Productos'),
          actions: [
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                IconButton(
                  icon: Icon(FontAwesomeIcons.shoppingCart),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ListaProductosCarritoPage()),
                    );
                  },
                ),
                Positioned(
                  top: 20.0,
                  left: 5.0,
                  // right: 0.0,
                  child: Container(
                    alignment: Alignment.center,
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color(0xFF47BB96),
                    ),
                    child: Text(
                      '9',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              height: size.iScreen(6.0),
              padding: EdgeInsets.all(size.iScreen(1.2)),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: categorias.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      print(categorias[i]);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal: size.iScreen(1.2),
                          vertical: size.iScreen(0.2)),
                      // height: 20.0,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.5),
                        borderRadius: BorderRadius.circular(size.iScreen(1.0)),
                        // color: Colors.red,
                      ),
                      margin:
                          EdgeInsets.symmetric(horizontal: size.iScreen(1.2)),
                      child: Text(
                        categorias[i],
                        style: TextStyle(fontSize: size.iScreen(2.0)),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                primary: false,
                slivers: <Widget>[
                  SliverPadding(
                      padding: EdgeInsets.all(size.iScreen(2.0)),
                      sliver: SliverGrid(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200.0,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                          childAspectRatio: 0.7,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return ItemProducto(
                              size: size,
                              index: index,
                            );
                          },
                          childCount: 25,
                        ),
                      )),
                ],
              ),
            ),
          ],
        ));
  }
}

class ItemProducto extends StatelessWidget {
  final int index;

  ItemProducto({
    @required this.size,
    @required this.index,
  });

  final Responsive size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.iScreen(1.5)),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(2, 2), // changes position of shadow
            ),
          ]),
      // color: Colors.teal[100 * (index % 9)],
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              // color: Colors.red,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(10.0),
                  topRight: const Radius.circular(10.0),
                ),
                child: Hero(
                  tag: this.index,
                  child: Image.network(
                    'https://picsum.photos/id/237/200/300',
                    // fit: BoxFit.contain,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: Colors.blue,
                  borderRadius: new BorderRadius.only(
                    bottomLeft: const Radius.circular(10.0),
                    bottomRight: const Radius.circular(10.0),
                  ),
                ),
                child: Column(
                  // mainAxisAlignment:
                  //     MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        // color: Colors.red,
                        // margin: EdgeInsets.symmetric(
                        // horizontal: size.iScreen(0.5),
                        // vertical: size.iScreen(1.0)
                        // ),
                        padding: EdgeInsets.only(left: size.iScreen(1.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Producto  Nuevo sdfsdfsdfsd dasdasdasd ',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: size.iScreen(2.0),
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Producto  Nuevo asfasfasfasfasf  ',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: size.iScreen(1.7),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        // color: Colors.blue,
                        // margin: EdgeInsets.symmetric(
                        // horizontal: size.iScreen(1.0),
                        // vertical: size.iScreen(1.0),
                        // ),
                        padding:
                            EdgeInsets.symmetric(horizontal: size.iScreen(0.5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$1250.00',
                              style: TextStyle(
                                  fontSize: size.iScreen(2.6),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        DetalleProductoCarritoPage(),
                                    settings: RouteSettings(arguments: index),
                                  ),
                                );
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(
                                      bottom: size.iScreen(0.0)),
                                  height: size.iScreen(4.5),
                                  width: size.iScreen(4.5),
                                  decoration: BoxDecoration(
                                      color: Color(0xFF47BB96),
                                      borderRadius:
                                          BorderRadius.circular(100.0)),
                                  child: Text(
                                    '+',
                                    style: TextStyle(
                                      fontSize: size.iScreen(3.5),
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
