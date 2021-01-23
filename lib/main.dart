import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:neitorvet/src/pages/chat_page.dart';
import 'package:neitorvet/src/pages/loading_page.dart';
import 'package:neitorvet/src/pages/usuarios_page.dart';
import 'package:neitorvet/src/pages/citas_page.dart';
import 'package:neitorvet/src/pages/compras_page.dart';
import 'package:neitorvet/src/pages/detalleFacturas.dart';
import 'package:neitorvet/src/pages/facturas_page.dart';
import 'package:neitorvet/src/pages/home_page.dart';
import 'package:neitorvet/src/pages/infoMascota_page.dart';
import 'package:neitorvet/src/pages/login_page.dart';
import 'package:neitorvet/src/pages/mascotas_page.dart';
import 'package:neitorvet/src/pages/splash_page.dart';
import 'package:neitorvet/src/services/auth_service.dart';
import 'package:neitorvet/src/services/chat_service.dart';
import 'package:neitorvet/src/services/socket_service.dart';
import 'package:provider/provider.dart';
// import 'package:NeitorVet/src/pages/splahZona_page.dart';

// import 'package:NeitorVet/src/providers/menuDopDoun.dart';
// import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthService(),
        ),
        ChangeNotifierProvider(
          create: (_) => SocketService(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChatService(),
        ),
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        // CONFIGURACION PARA EL DATEPICKER
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'), // English, no country code
          const Locale('es', 'ES'), // Hebrew, no country code
          // const Locale.fromSubtags(
          //     languageCode: 'zh'), // Chinese *See Advanced Locales below*
          // ... other locales the app supports
        ],
        theme: ThemeData(
          // brightness:     Brightness.light,
          primaryColor: Color(0xFF971B81),
          /*Color(0xFF47BB96)*/
          accentColor: Color(0xFF4487c7),
        ),
        initialRoute: 'loading',
        routes: {
          'splash': (_) => SplashPage(),
          'loading': (_) => LoadingPage(),
          'home': (_) => HomePage(),
          'login': (_) => LoginPage(),
          'mascotas': (_) => MisMascotasPage(),
          'infomascota': (_) => InfoMascotaPage(),
          'misMascotas': (_) => MisMascotasPage(),
          'citas': (_) => SolicitarCitaPage(),
          'compras': (_) => ComprasPage(),
          'facturas': (_) => ListaFacturasPage(),
          'detalleFactura': (_) => DetalleFacturaPage(),
          'chat': (_) => ChatPage(),
          'usuarios': (_) => UsuariosPage(),
        },
      ),
    );
  }
}
