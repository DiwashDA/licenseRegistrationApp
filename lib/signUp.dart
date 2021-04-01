import 'package:flutter/material.dart';
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Sign Up', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),),
              SizedBox(height: 15,),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(color: Colors.grey),
                ),
                  labelText: 'Name'
              ),
              ),
              SizedBox(height: 15,),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'Email Address'
                ),
              ),
              SizedBox(height: 15,),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'Password'
                ),
              ),
              SizedBox(height: 15,),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'Confirm Password'
                ),
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  InkWell(
                    onTap: (){

                    },
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      color: Colors.cyan,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text('Sign Up', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: InkWell(
                      child: Text('Or',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                    ),
                  )],
              ),



            ],
          ),
        ),

      ),
    );
  }
}
