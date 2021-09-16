import 'package:dio/dio.dart';
import 'package:license_online/utils.dart';

class ApiService {
  String baseUrl = "https://licenseregistrationsystem.herokuapp.com/api/v1/";

  Future login(String email, String password) async {
    var data = {"userEmail": "$email", "userPassword": "$password"};
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

  Future changePassword(oldPass, newPass, confirmPass) async {
    var data = {};
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

  Future newApplication() async {
    var data = {};
    FormData formData = new FormData.fromMap(data);
    var token = await Utils.getToken();
    Dio().options.headers = {'authorization': 'Bearer+$token'};
    try {
      var response = await Dio().post(baseUrl + "users/login", data: formData);
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

  Future register(
      address, password, name, email, dob, contact, confirmPassword) async {
    var data = {
      "userAddress": "$address",
      "userPassword": "$password",
      "userName": "$name",
      "userEmail": "$email",
      "userDOB": "$dob",
      "userContact": "$contact",
      "passwordConfirm": "$confirmPassword"
    };
    try {
      var response = await Dio().post(baseUrl + "users/register", data: data);
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

  Future getApplicantList() async {
    var token = await Utils.getToken();
    Dio().options.headers = {'authorization': 'Bearer+$token'};
    try {
      var response = await Dio().get(baseUrl + "applicants");
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
  Future getAnApplicant(id)async{
    var token = await Utils.getToken();
    Dio().options.headers = {'authorization': 'Bearer+$token'};
    try {
      var response = await Dio().get(baseUrl + "applicants/$id");
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
  Future getAccountDetails()async{
    var token = await Utils.getToken();
    Dio().options.headers = {'authorization': 'Bearer+$token'};
    try {
      var response = await Dio().get(baseUrl + "users/me");
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
