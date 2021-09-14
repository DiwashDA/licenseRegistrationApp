import 'package:dio/dio.dart';

class ApiService {
  String baseUrl = "https://licenseregistrationsystem.herokuapp.com/api/v1/";

  Future login(String email, String password) async {
    var data = {
      "userEmail": "$email",
      "userPassword": "$password"
    };
    try {
      var response = await Dio().post(baseUrl + "users/login", data: data);
      print(response.data);
      if (response.statusCode == 200)
        return response.data;
      else
        print("sadbajd");
    } on DioError catch (e) {
      print(e.response);
      return e;
    }
  }
}
