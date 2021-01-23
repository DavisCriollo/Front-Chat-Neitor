// import 'package:chatapp/global/environment.dart';
// import 'package:chatapp/src/models/mensajes_response.dart';
// import 'package:chatapp/src/models/usuario.dart';
// import 'package:chatapp/src/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:neitorvet/src/global/environment.dart';
import 'package:neitorvet/src/models/mensajes_response.dart';
import 'package:neitorvet/src/models/usuario.dart';
import 'package:neitorvet/src/services/auth_service.dart';

class ChatService with ChangeNotifier
{
  Usuario usuarioPara;

Future<List<Mensaje>> getChat(String usuarioID) async
{
  final resp = await http.get('${Environments.apiUrl}/mensajes/$usuarioID', headers: {
        'Content-Type': 'application/json',
        'x-token':await AuthService.getToken()
      });


final dataResponse= mensajesResponseFromJson(resp.body);

if(resp.statusCode==200)
{
return dataResponse.mensajes;
}
else{
  return[];
}


}


  

}


