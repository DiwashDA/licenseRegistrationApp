import 'package:flutter/material.dart';
import 'package:tax_online/indexPage.dart';
import 'package:tax_online/registerPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

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

              TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: Colors.orange)),
                        prefixIcon: Icon(Icons.person),
                        labelText: 'Username'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Username Required';
                      } else {
                        return null;
                      }
                    },
                  ),

                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.orange)),
                    prefixIcon: Icon(Icons.lock_open),
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Required ";
                    } else if (value.length < 6) {
                      return "Password should be 6 characters long";
                    } else {
                      return null;
                    }
                  },
                ),
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
                    color: Colors.indigo,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Log In',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.orange),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Card(
                        elevation: 0.0,
                        child: Text(
                          'Need Help?',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ],
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
}
