import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/home.jpg',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    SizedBox(
                      height: 150,
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
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>IndexPage()));
                      },
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
