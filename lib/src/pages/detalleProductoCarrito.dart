
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neitorvet/src/utils/responsive.dart';

class DetalleProductoCarritoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    final productoData = ModalRoute.of(context).settings.arguments;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Hero(
                    tag: productoData,
                    child: Container(
                      width: size.wScreen(100.0),
                      color: Colors.red,
                      child: Image.asset(
                        'assets/imgs/img-demo.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.chevronLeft,
                      size: size.iScreen(3.3),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: size.iScreen(3.0), vertical: size.iScreen(3.0)),
                width: size.wScreen(100.0),
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      width: size.wScreen(100.0),
                      margin: EdgeInsets.only(
                        top: size.iScreen(2.0),
                      ),
                      child: Text(
                        'Beethoven ',
                        style: TextStyle(
                            fontSize: size.iScreen(2.9),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: size.wScreen(100.0),
                      margin: EdgeInsets.only(
                          top: size.iScreen(1.0), bottom: size.iScreen(3.0)),
                      child: Text(
                        'golden retriever',
                        style: TextStyle(
                            fontSize: size.iScreen(2), color: Colors.grey),
                      ),
                    ),
                    Container(
                      // color: Colors.red,
                      width: size.wScreen(100.0),
                        margin: EdgeInsets.only(
                        top: size.iScreen(0.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                                                      child: Container(
                              // color: Colors.red,
                              child: Text(
                                '\$150.00',
                                style: TextStyle(
                                    fontSize: size.iScreen(3.0),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            width: size.iScreen(20.0),
                            // color: Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    print('Down');
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 3.0),
                                    alignment: Alignment.center,
                                    width: size.iScreen(4.5),
                                    height: size.iScreen(4.5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Color(0xFF47BB96),
                                    ),
                                    child: Text(
                                      '-',
                                      style: TextStyle(
                                        fontSize: size.iScreen(3.5),
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                  // color: Colors.pink,
                                      // border: Border(bottom: BorderSide(width: 1.0)),
                                      // color: Color(0xFF47BB96),
                                      ),
                                  // width: size.iScreen(7.0),
                                  child: Text(
                                    '1',
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
                                    width: size.iScreen(4.5),
                                    height: size.iScreen(4.5),
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
                    ),
                    Expanded(
                                          child: Container(
                                             
                        width: size.wScreen(100.0),
                        height: size.hScreen(20.0),
                        margin: EdgeInsets.only(
                          top: size.iScreen(2.0),
                        ),
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                                                child: Text(
                            'El golden retriever,a presa. a presa.DragStartBehavior.start presa.DragStartBehavior.startpresa.DragStartBehavior.spresa.DragStartBehavior.startpresa.DragStartBehavior.startpresa.DragStartBehavior.startpresa.DragStartBehavior.starttartpresa.DragStartBehavior.startpresa.DragStartBehavior.startpresa.DragStartBehavior.startpresa.DragStartBehavior.startpresa.DragStartBehavior.startpresa.DragStartBehavior.startpresa.DragStartBehavior.startpresa.DragStartBehavior.start .',
                            style: TextStyle(
                                fontSize: size.iScreen(2), color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: size.wScreen(100.0),
                      margin: EdgeInsets.only(
                        top: size.iScreen(2.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                    fontSize: size.iScreen(2.0),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '\$ 300.00',
                                style: TextStyle(
                                    fontSize: size.iScreen(3.0),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.iScreen(2.0),
                                vertical: size.iScreen(1.2)),
                            decoration: BoxDecoration(
                                color: Color(0xFF47BB96),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Text(
                              'Agregar al Carrito',
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
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
