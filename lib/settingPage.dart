import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:license_online/changePassword.dart';
import 'package:license_online/utils.dart';
class SettingPage extends StatefulWidget {
  const SettingPage({Key key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body: Stack(

      children: [
        Utils.bgImage(context),
        Container(
          color: Utils.color,
          child: ListView(
            children: [
              Utils.appBar('home', 'Settings', context),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePassword()));
                  },
                  child: Card(
                    color: Colors.blue[100],
                    elevation: 8.0,
                    child: ListTile(
                      leading: Icon(Icons.phonelink_lock, size: 30.0,),
                      title: Text(
                        'Change Password', style: TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w500),),
                      subtitle:
                      Text('Change User Password'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                  onTap: (){

                  },
                  child: Card(
                    color: Colors.lightBlueAccent,
                    elevation: 8.0,
                    child: ListTile(
                      leading: Icon(Icons.list_alt, size: 30.0,),
                      title: Text('Terms and Conditions', style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w500),),
                      subtitle: Text('Read carefully'),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ),
    );

  }
}