import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  String? _token;

  String? get token => _token;

  bool get isAuthenticated => _token != null;

  // Load token on app start
  Future<void> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('authToken');
    notifyListeners();
  }

  // Signup function
  Future<bool> signUp(String email, String password) async {
    final url =
        Uri.parse("https://reqres.in/api/register"); // Replace with your API
    try {
      final response = await http.post(
        url,
        body: json.encode({
          "email": email,
          "password": password,
        }),
        headers: {"Content-Type": "application/json"},
      );

      final responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        _token = responseData['token'];
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('authToken', _token!); // Store token
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  // Login function
  Future<bool> login(String email, String password) async {
    final url =
        Uri.parse("https://reqres.in/api/login"); // Replace with your API
    try {
      final response = await http.post(
        url,
        body: json.encode({
          "email": email,
          "password": password,
        }),
        headers: {"Content-Type": "application/json"},
      );

      final responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        final receivedToken = responseData['token']; // Token from API

        final prefs = await SharedPreferences.getInstance();
        final storedToken =
            prefs.getString('authToken'); // Retrieve stored token

        if (storedToken != null && storedToken == receivedToken) {
          _token = receivedToken;
          notifyListeners();
          return true; // Login successful, tokens match
        }
      }
      return false; // Login failed
    } catch (error) {
      return false;
    }
  }

  // Logout function
}
