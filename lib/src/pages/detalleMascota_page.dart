
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neitorvet/src/utils/responsive.dart';

class DetalleMascotaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Hero(
                    tag: '1',
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
                
                padding: EdgeInsets.symmetric(horizontal: size.iScreen(3.0),vertical: size.iScreen(3.0)),
                width: size.wScreen(100.0),
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                       width: size.wScreen(100.0),
                       margin: EdgeInsets.only( top: size.iScreen(2.0),),
                      child: Text(
                            'Beethoven',
                            style: TextStyle(fontSize: size.iScreen(2.9),fontWeight: FontWeight.bold),
                          ),
                    ),
                        Container(
                           width: size.wScreen(100.0),
                            margin: EdgeInsets.only( top: size.iScreen(1.0),bottom:size.iScreen(3.0)),
                          child: Text(
                            'golden retriever',
                            style: TextStyle(
                                fontSize: size.iScreen(2), color: Colors.grey),
                          ),
                        ),
                        Container(
                           width: size.wScreen(100.0),
                            margin: EdgeInsets.only( top: size.iScreen(1.0),),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Macho Maduro',
                                style: TextStyle(
                                    fontSize: size.iScreen(2.3), color: Colors.grey,fontWeight: FontWeight.bold),
                                    
                              ),
                              Text(
                                '2 años',
                                style: TextStyle(
                                    fontSize: size.iScreen(2.3), color: Colors.grey,fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Container(
                           width: size.wScreen(100.0),
                           margin: EdgeInsets.only( top: size.iScreen(2.0),),
                          child: Text(
                            'El golden retriever, también conocido como cobrador dorado es originario de Reino Unido, más concretamente de Escocia. Nace alrededor del 1850 con la búsqueda de un perro cobrador y levantador que fuera capaz de no lastimar a la presa. Por ese motivo observamos en él habilidades de caza. También es conocido como perdiguero dorado.',
                            style: TextStyle(
                                fontSize: size.iScreen(2), color: Colors.grey),
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
