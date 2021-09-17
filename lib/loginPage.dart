import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:license_online/api/service.dart';
import 'package:license_online/indexPage.dart';
import 'package:license_online/registerPage.dart';
import 'package:license_online/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Utils.bgImage(context),
          Container(
            color: Colors.black.withOpacity(0.5),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    SizedBox(
                      height: 130,
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/card.jpg',
                          height: 200,
                          width: 400,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Utils.formField(
                        email,
                        'Email',
                        Icon(
                          Icons.email_outlined,
                          color: Colors.black,
                        ),
                        false,
                        Validator.emailValidator),
                    SizedBox(
                      height: 15.0,
                    ),
                    Utils.formField(
                        password,
                        'Password',
                        Icon(
                          Icons.lock_open_outlined,
                          color: Colors.black,
                        ),
                        true,
                        Validator.passValidator),
                    SizedBox(
                      height: 15.0,
                    ),
                    InkWell(
                      onTap: onLogin,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        color: Colors.green,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'Log In',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Text(
                        "Don't have an account?",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, color: Utils.white),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    register(),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  onLogin() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => IndexPage()));
    print("i am here");
    var em = email.text;
    var pw = password.text;
    ApiService().login(em, pw).then((value) {
      Utils.saveToken(value);
      print(value);
    });
  }

  afterLogin(value) async{

  }

  Widget register() {
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => RegisterPage()));
        },

        // child: Text(
        //   "Sign Up Now",
        //   style: TextStyle(
        //       fontWeight: FontWeight.w600,
        //       color: Utils.white,
        //       fontSize: 20,
        //       decoration: TextDecoration.underline),
        // ),
        child: Text("Sign Up Now",style: TextStyle(fontWeight: FontWeight.w600,color: Utils.white,fontSize: 20, decoration: TextDecoration.underline,
        ),),
      ),
    );
  }
}
