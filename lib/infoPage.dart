import 'package:flutter/material.dart';
class InfoPage extends StatefulWidget {
  const InfoPage({Key key}) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.deepPurple,
              ),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'About this App',
          style: TextStyle(color: Colors.deepPurple),
        ),
      ),
      body: ListView(
        children: [

        ],
      ),
    );
  }
}
