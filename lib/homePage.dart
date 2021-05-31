import 'package:flutter/material.dart';
import 'package:tax_online/loginPage.dart';
import 'package:tax_online/registerPage.dart';
class Homepage extends StatefulWidget {
  const Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.indigo,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              Image(image: AssetImage("assets/home.jpg"),height: 200,),
              SizedBox(
                height: 10.0,
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                },
                borderRadius: BorderRadius.circular(0.0),
                child: Card(

                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("Log In", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.orange),textAlign: TextAlign.center,),
                  ),

                ),

              ),
              SizedBox(
                height: 10,),
              InkWell(
                onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                },

                child: Card(

                  color: Colors.orange,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("Register Now",style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white),textAlign: TextAlign.center,),
                  ),

                  shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(3.0)),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
