
import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neitorvet/src/pages/acercaDe_page.dart';
import 'package:neitorvet/src/pages/contactenos_page.dart';
import 'package:neitorvet/src/pages/perfilUser_page.dart';
import 'package:neitorvet/src/utils/responsive.dart';

class MenuHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    return SafeArea(
      child: Drawer(
        child: Container(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(size.iScreen(2.0)),
                    width: double.infinity,
                    height: size.hScreen(20.0),
                    child: CircleAvatar(
                      backgroundColor: Color(0xFF963494),
                      child: Text(
                        'DC',
                        style: TextStyle(fontSize: size.iScreen(6.0)),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10.0,
                    right: 100.0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.grey.withOpacity(0.7),
                      ),
                      alignment: Alignment.center,
                      width: size.iScreen(4.0),
                      height:size.iScreen(4.0),
                      child: IconButton(
                        splashRadius: 25.0,
                        icon: Icon(
                          FontAwesomeIcons.pen,
                          color: Colors.black.withOpacity(0.5),
                          size: size.iScreen(2.0),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => FadeIn(
                                  duration: Duration(seconds: 2),
                                  child: PerfilPage()),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              //============ MENU  ===================//
              // Expanded(
                // child: _ListMenuHome(size: size),
              // ),
              // =====================================//
              ListTile(
                title: Text('Contáctenos',style: TextStyle(fontSize:size.iScreen(1.7),),),
                leading: Icon(FontAwesomeIcons.clinicMedical,color:Color(0xFF963494)),
                trailing: Icon(
                  FontAwesomeIcons.chevronRight,
                  size: size.iScreen(1.6),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => FadeIn(
                          duration: Duration(seconds: 2), child: ContactenosPage()),
                    ),
                  );
                },
              ),
                 ListTile(
                title: Text('Acerca de',style: TextStyle(fontSize:size.iScreen(1.7),)),
                leading: Icon(FontAwesomeIcons.cog,color:Color(0xFF963494)),
                trailing: Icon(
                  FontAwesomeIcons.chevronRight,
                  size: size.iScreen(1.6),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => FadeIn(
                          duration: Duration(seconds: 2), child: AcercaDePage()),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class _ListMenuHome extends StatelessWidget {
//   final Responsive size;

//   _ListMenuHome({
//     @required this.size,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       itemCount: pagesRoute.length,
//       separatorBuilder: (context, i) => Divider(
//         color: Colors.grey,
//       ),
//       itemBuilder: (context, i) => ListTile(
//         dense: true,
//         leading: Icon(pagesRoute[i].icon, color:Color(0xFF963494),),
//         title: Text(pagesRoute[i].titulo,style: TextStyle(fontSize:size.iScreen(1.7),)),
//         trailing: Icon(
//           FontAwesomeIcons.chevronRight,
//           size: size.iScreen(1.6),
//         ),
//         onTap: () {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => pagesRoute[i].page));
//         },
//       ),
//     );
//   }
// }
