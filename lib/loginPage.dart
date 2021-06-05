import 'package:flutter/material.dart';
import 'package:license_online/indexPage.dart';
import 'package:license_online/registerPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);
  addBoolToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('boolValue', true);
  }

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
final _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset('assets/home.jpg'),
              ),

              formField('Email', Icon(Icons.email_outlined), false, emailValidator),

                SizedBox(
                  height: 15.0,
                ),
                formField('Password', Icon(Icons.lock_open_outlined), true, passValidator),
                SizedBox(
                  height: 15.0,
                ),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => IndexPage()));
                    } else {
                      print("Not Validated");
                    }
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    color: Colors.lightBlueAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Log In',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.purple),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              child: Text(
                'Do not have an account?',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterPage()));
            },
            child: Text(
              'Register',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
                color: Colors.teal,
              ),
            ),
          ),
        ],
      ),
    );
  }
Widget formField(String label,Widget icon,bool obs,String Function(String) validator){
  return TextFormField(
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      labelText: label,
      prefixIcon: icon,
    ),
    obscureText: obs,
    validator: validator,
  );
}
String emailValidator(String email){
  if (RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email)) {
    return null;
  } else {
    return "Invalid Email !";
  }
}
String passValidator(String password){
  if(password.isEmpty){
    return "Required ";
  }else if(password.length<6) {
    return "Password should be 6 characters long";
  }else if(password.length>15) {
    return "Password should not be greater than 15 characters";
  }else
    return null;
}
void navigateUser() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var status = prefs.getBool('boolValue') ?? false;
  print(status);
  if (status) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>IndexPage()));
  } else {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
  }
}
}
