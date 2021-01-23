import 'package:flutter/material.dart';
import 'package:neitorvet/src/pages/home_page.dart';
import 'package:neitorvet/src/pages/login_page.dart';
import 'package:neitorvet/src/services/auth_service.dart';
import 'package:neitorvet/src/services/socket_service.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Center(
            child: Text('Espere...'),
          );
        },
      ),
    );
  }

  Future checkLoginState(BuildContext context) async {
    final authService = Provider.of<AuthService>(context, listen: false);
    final socketService = Provider.of<SocketService>(context, listen: false);

    final autenticado = await authService.isLoggedIn();
    if (autenticado) {
      socketService.connect();
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => HomePage(),
            transitionDuration: Duration(milliseconds: 0)),
      );
    } else {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => LoginPage(),
            transitionDuration: Duration(milliseconds: 0)),
      );
    }
  }
}
