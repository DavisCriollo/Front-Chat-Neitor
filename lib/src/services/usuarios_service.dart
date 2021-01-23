


import 'package:http/http.dart' as http;
import 'package:neitorvet/src/global/environment.dart';

import 'package:neitorvet/src/models/usuario.dart';
import 'package:neitorvet/src/models/usuarios_response.dart';
import 'package:neitorvet/src/services/auth_service.dart';

class UsuariosService {
  Future<List<Usuario>> getUsuarios() async {
    try {
      final resp = await http.get('${Environments.apiUrl}/usuarios', headers: {
        'Content-Type': 'application/json',
        'x-token':await AuthService.getToken()
      });



final dataResponse= usuarioResponseFromJson(resp.body);
return dataResponse.usuarios;


    } catch (e) {
      return [];
    }
  }
}