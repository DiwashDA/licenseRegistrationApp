import 'dart:io';
import 'package:dio/dio.dart';
import 'package:license_online/utils.dart';
import 'package:path/path.dart' as p;
import 'package:http_parser/http_parser.dart';


class ApiService {
  String baseUrl = "https://licenseregistrationsystem.herokuapp.com/api/v1/";

  Future login(String email, String password) async {
    var data = {"userEmail": "$email", "userPassword": "$password"};
    try {
      var response = await Dio().post(baseUrl + "users/login", data: data);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future logOut() async {
    try {
      var response = await Dio().post(baseUrl + "users/logout");
      return response.data;
    } on DioError catch (e) {
      return e;
    }
  }

  Future changePassword(oldPass, newPass, confirmPass) async {
    var data = {};
    var token = Utils.getToken();
    Dio dio  =Dio();
    dio.options.headers["authorization"] = "Bearer ${token}";

    try {
      var response = await dio.patch(baseUrl + "users/login", data: data);
      print(response.data);
      return response.data;
    } on DioError catch (e) {
      return e;
    }
  }
  Future getExamDate(id)async{
    Dio dio = Dio();
    var token = Utils.getToken();
    dio.options.headers["authorization"] = "Bearer ${token}";
    try {
      var response = await dio.post(baseUrl + "licenseRegistrations/$id");
      print(response.statusCode);
      if (response.statusCode == 201) {
        print(response.statusCode);
        return response.statusCode;
      }
    } on DioError catch (e) {
      print(e.response.data);
      return e.response.data;
    }

  }

  Future newApplication(
      applicantName,
      applicantCitizenshipNumber,
      applicantAddress,
      applicantDOB,
      applicantGender,
      File applicantPhoto,
      transportationOffice,
      licenseType) async {
    Dio dio = Dio();
    print(applicantPhoto.path);
    var extension = p.extension(applicantPhoto.path);
    extension=extension.replaceAll(".", "");
    var file = await MultipartFile.fromFile(
      applicantPhoto.path,
      filename: applicantPhoto.path.split('/').last,
      contentType: MediaType("image","$extension")
    );
    FormData formData = new FormData.fromMap({
    'applicantName': "$applicantName",
    'applicantCitizenshipNumber': "$applicantCitizenshipNumber",
    'applicantAddress': "applicantAddress",
    'applicantDOB': "$applicantDOB",
    'applicantGender': "$applicantGender",
    'transportationOffice': "transportationOffice",
    'licenseType': "licenseType",
     'applicantPhoto':file
    });
    var token = await Utils.getToken();
    print(token);
    dio.options.headers["authorization"] = "Bearer ${token}";
    dio.options.headers["content-type"] = "multipart/form-data";
    try {
      var response = await dio.post(baseUrl + "applicants", data: formData);
      return response;
    } on DioError catch (e) {
      return e.response;
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
      print(response.statusCode);
      if (response.statusCode == 201) {
        print(response.statusCode);
        return response.statusCode;
      }
    } on DioError catch (e) {
      print(e.response.data);
      return e.response.data;
    }
  }

  Future getApplicantList() async {
    Dio dio = Dio();
    var token = await Utils.getToken();
    dio.options.headers["authorization"] = "Bearer ${token}";
    try {
      var response = await dio.get(baseUrl + "applicants");
      return response.data['data']['applicantList'];
    } on DioError catch (e) {
      return e;
    }
  }

  Future getAnApplicant(id) async {
    Dio dio = Dio();
    var token = await Utils.getToken();
    dio.options.headers["authorization"] = "Bearer ${token}";
    try {
      var response = await dio.get(baseUrl + "applicants/$id");
      print(response.data);
      return response.data['data']['data'];
    } on DioError catch (e) {
      return e;
    }
  }

  Future getAccountDetails() async {
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
