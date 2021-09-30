import 'package:flutter/material.dart';
import 'package:license_online/api/service.dart';
import 'package:license_online/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  static Widget bgImage(context) {
    return Image.asset(
      'assets/home.jpg',
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
    );
  }
  static saveToken(value)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(value);
    print(value.data["token"]);
    pref.setString("token", value.data["token"]);
  }
  static Future getToken()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.getString("token");
  }
  static Widget appBar(String key, String title, BuildContext context){
    return AppBar(
      title: Text(title),
      leading: (key!="home")? IconButton(onPressed: () {
        Navigator.pop(context);
      }, icon: Icon(Icons.arrow_back)):Container(),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      actions: [
        (key=="home")?  IconButton(
            icon: Icon(
              Icons.logout,
              color: Utils.white,
            ),
            onPressed: () {
              ApiService().logOut().then((value){
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                  });
            }):Container(),
      ],
    );
  }
  static Color white = Colors.white;
  static Color color = Colors.black.withOpacity(0.5);
  static swipe(){
    return Container(
      color: Utils.color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.arrow_left,
            color: Colors.green,
            size: 40,
          ),
          Icon(
            Icons.arrow_left,
            color: Colors.green,
            size: 40,
          ),
          Icon(
            Icons.arrow_left,
            color: Colors.green,
            size: 40,
          ),
          Text(
            "SWIPE",
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w800,
                fontSize: 20),
          ),
          Icon(
            Icons.arrow_right,
            color: Colors.green,
            size: 40,
          ),
          Icon(
            Icons.arrow_right,
            color: Colors.green,
            size: 40,
          ),
          Icon(
            Icons.arrow_right,
            color: Colors.green,
            size: 40,
          ),
        ],
      ),
    );
  }

  static Widget formField(TextEditingController controller, String label,
      Widget icon, bool obs, String Function(String) validator) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.6),
          focusColor: Colors.black,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(8.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(8.0),
          ),
          labelText: label,
          labelStyle: TextStyle(color: Colors.white,fontSize: 18),
          prefixIcon: icon,
        ),
        obscureText: obs,
        validator: validator,
      ),
    );
  }

  static button(onTap, context) {
    return InkWell(
      onTap: onTap(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            'Log In',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class Validator {
  static String emailValidator(String email) {
    if (RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email)) {
      return null;
    } else {
      return "Invalid Email !";
    }
  }

  static String passValidator(String password) {
    if (password.isEmpty) {
      return "Required ";
    } else if (password.length < 6) {
      return "Password should be 6 characters long";
    } else if (password.length > 15) {
      return "Password should not be greater than 15 characters";
    } else
      return null;
  }
}
