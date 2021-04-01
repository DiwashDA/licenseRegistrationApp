import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:my_app/submitPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ListView(
            padding: EdgeInsets.all(10),
            shrinkWrap: true,
            children: [
              Container(
                color: Colors.red,
                height: 30,
              ),
              Container(
                color: Colors.green,
                height: 30,
              ),
              Container(
                color: Colors.blue,
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: 'Name *',
                ),


              ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'name *',
                suffixIcon: Icon(Icons.person),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SubmitPage()));
                },
                child: Card(
                  color: Colors.red,
                  child: Text('Submit'),
                ),
              ),
            )
            ],
          ),
          Text('data'),
          Text('data')
        ],
        

      ),
    );
  }
}
