import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/login_model.dart';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    // String url = "https://reqres.in/api/login";
    String url = "https://siup.universitaspertamina.ac.id/mobile/v1/login";

    final response = await http.post(url, body: requestModel.toJson());
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 500) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}