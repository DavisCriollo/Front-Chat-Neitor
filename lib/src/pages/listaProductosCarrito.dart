
import 'package:flutter/material.dart';
import 'package:neitorvet/src/utils/responsive.dart';

class ListaProductosCarritoPage extends StatelessWidget {
  final List<String> productos = [
    'Collar',
    'Tijetas',
    'Vitaminas',
    'Camisa',
    'Perfume',
    'Cadena',
    'Pastilla',
    'Jarabe',
    'Plato',
    'Almohada',
    'Juguete',
  ];

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos Elegidos'),
      ),
      // physics: BouncingScrollPhysics(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: productos.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemsCarrito(size: size);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: size.iScreen(2.2), vertical: size.iScreen(0.5)),
            decoration: BoxDecoration(
              color: Colors.white /*Color(0xFFD6D6D6)*/,
              /*0xFF4C1760*/
              border: Border.all(color: Color(0xFF4C1760), width: 2.0),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                // bottomLeft: Radius.circular(10),
                // bottomRight: Radius.circular(10)
              ),
            ),
            height: size.hScreen(15.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              'Subtotal:',
                              style: TextStyle(
                                  fontSize: size.iScreen(2.2),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text(
                              '264.00',
                              style: TextStyle(
                                  fontSize: size.iScreen(2.2),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                     
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              'Descuento:',
                              style: TextStyle(
                                  fontSize: size.iScreen(2.2),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text(
                              '12.00',
                              style: TextStyle(
                                  fontSize: size.iScreen(2.2),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              'Iva:',
                              style: TextStyle(
                                  fontSize: size.iScreen(2.2),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text(
                              '264.00',
                              style: TextStyle(
                                  fontSize: size.iScreen(2.2),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              'Total Pagar:',
                              style: TextStyle(
                                  fontSize: size.iScreen(2.5),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text(
                              ' 264.00',
                              style: TextStyle(
                                  fontSize: size.iScreen(2.5),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: size.iScreen(2.0)),
                  padding: EdgeInsets.symmetric(
                    horizontal: size.iScreen(2.0),
                    vertical: size.iScreen(1.0),
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xFF47BB96),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Text(
                    'Pagar',
                    style: TextStyle(
                        fontSize: size.iScreen(2.2),
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
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

class ItemsCarrito extends StatelessWidget {
  const ItemsCarrito({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Responsive size;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(color: Color(0xFFb95149)),
      key: UniqueKey(),
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: size.iScreen(2.0), vertical: size.iScreen(1.0)),
        width: size.wScreen(100.0),
        height: size.hScreen(15.0),
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
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0)),
              child: Container(
                // height: size.hScreen(112.0),
                width: size.hScreen(12.0),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.6),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                  ),
                ),
                child: Image.network(
                  'https://picsum.photos/id/237/200/300',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(size.iScreen(1.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: size.iScreen(18.0),
                          child: Text(
                            'Beethovenhjhjhjhjhjdddsdshhjhadsasdasj',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: size.iScreen(2.5)),
                          ),
                        ),
                        Text(
                          'golden retriever',
                          style: TextStyle(
                              fontSize: size.iScreen(2), color: Colors.grey),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: size.iScreen(1.0)),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print('Down');
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 3.0),
                                  alignment: Alignment.center,
                                  width: size.iScreen(4.0),
                                  height: size.iScreen(4.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Color(0xFF47BB96),
                                  ),
                                  child: Text(
                                    '-',
                                    style: TextStyle(
                                      fontSize: size.iScreen(3.0),
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // color: Colors.pink,
                                decoration: BoxDecoration(
                                    // border: Border(bottom: BorderSide(width: 1.0)),
                                    // color: Color(0xFF47BB96),
                                    ),
                                width: 50.0,
                                child: Text(
                                  '2',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: size.iScreen(2.5),
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  print('Up');
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 3.0),
                                  alignment: Alignment.center,
                                  width: size.iScreen(4.0),
                                  height: size.iScreen(4.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Color(0xFF47BB96),
                                  ),
                                  child: Text(
                                    '+',
                                    style: TextStyle(
                                      fontSize: size.iScreen(3.5),
                                      color: Colors.white,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(fontSize: size.iScreen(1.8)),
                        ),
                        Text(
                          '\$300.00',
                          style: TextStyle(
                              fontSize: size.iScreen(
                                2.2,
                              ),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
