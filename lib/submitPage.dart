import 'package:flutter/material.dart';
import 'package:my_app/homePage.dart';
import 'package:my_app/signUp.dart';


class SubmitPage extends StatefulWidget {
  @override
  _SubmitPageState createState() => _SubmitPageState();
}

class _SubmitPageState extends State<SubmitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.person),
        ),
      ),
      body: Container(
        color: Colors.grey,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.start,
            //shrinkWrap: true,
            children: [
              Text('Log In',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.grey),

                  ),
                  prefixIcon: Icon(Icons.people),
                  labelText: 'Username',
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  prefixIcon: Icon(Icons.warning_rounded),
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                    },
                    child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      color: Colors.cyan,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text('Log In',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  InkWell(
                    onTap: (){},
                    child: Card(
                      color: Colors.grey,
                      child: Text('Need Help?',style: TextStyle(decoration: TextDecoration.underline,),

                  ),
                    ),
                  ),],
              ),
              SizedBox(height: 150),
              Row(
                children: [
                  InkWell(
                    child: Text('Do not have an account?',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                      ),),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                    },
                    child: Text('Sign Up',
                    style: TextStyle(
                      fontSize:15,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      color: Colors.teal,
                    ),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
