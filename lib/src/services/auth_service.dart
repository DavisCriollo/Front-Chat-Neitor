// import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:neitorvet/src/global/environment.dart';
import 'package:neitorvet/src/models/login_response.dart';
import 'package:neitorvet/src/models/usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService with ChangeNotifier {
  // final Dio _dio = new Dio();

  Usuario usuario;

  bool _autenticando = false;
// Create storage
  // final _storage = new FlutterSecureStorage();

  bool get autenticando => this._autenticando;

  set autenticando(bool valor) {
    this._autenticando = true;
    notifyListeners();
  }

  // Future<bool> login(String email, String password) async {
  //       try {
  //         this.autenticando=true;
  //     final Response response = await this._dio.post(
  //       '${Environments.apiUrl}/login/',
  //       data: {
  //         "email": email,
  //         "password": password,
  //       },
  //     );

  //       this.autenticando=false;
  //     if (response.statusCode == 200) {
  //       final dataRespondes = loginResponseFromJson(response.data);
  //       this.usuario = dataRespondes.usuario;
  //       return true;
  //     }
  //     else
  //     {
  //       return false;
  //     }
  //   } catch (e) {}
  // }

  Future<bool> login(String email, String password) async {
    this.autenticando = true;

    final data = {
      'email': email,
      'password': password,
    };

    final resp = await http
        .post('${Environments.apiUrl}/login', body: jsonEncode(data), headers: {
      'Content-Type': 'application/json',
    });

    // print(resp.body);
    this.autenticando = false;

    if (resp.statusCode == 200) {
      final decodedData = loginResponseFromJson(resp.body);
      this.usuario = decodedData.usuario;
      await this._guardarToken(decodedData.token);
      return true;
    } else {
      return false;
    }
  }

  Future _guardarToken(String token) async {
// Write value
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);

    // await _storage.write(key: 'token', value: token);
  }

  // OBTENGO EL TOKEN  DE MANERA STATIC
  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    //Creo la instancia del storage
    // final _storage = new FlutterSecureStorage();
    // Read value
    // final token = await _storage.read(key: 'token');

    return token;
  }

  // BORRAMOS EL TOKEN  DE MANERA STATIC
  static Future<void> deleteToken() async {
    // final _storage = new FlutterSecureStorage();
    // delete value
    // await _storage.delete(key: 'token');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  Future logout() async {
// Delete value
    // await _storage.delete(key: 'token');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  Future<bool> isLoggedIn() async {
    // final token = await this._storage.read(key: 'token');
     SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final resp = await http.get('${Environments.apiUrl}/login/renew', headers: {
      'Content-Type': 'application/json',
      'x-token': token,
    });

    if (resp.statusCode == 200) {
      final decodedData = loginResponseFromJson(resp.body);
      this.usuario = decodedData.usuario;
      await this._guardarToken(decodedData.token);
      return true;
    } else {
      this.logout();
      return false;
    }
  }
}
