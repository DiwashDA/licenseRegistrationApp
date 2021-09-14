import 'package:flutter/material.dart';

class Utils {

  static Widget formField(
      String label, Widget icon, bool obs, String Function(String) validator) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.5),
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
        labelStyle: TextStyle(color: Colors.black),
        prefixIcon: icon,
      ),
      obscureText: obs,
      validator: validator,
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
