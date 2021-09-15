import 'package:flutter/material.dart';
import 'package:license_online/utils.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key key}) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
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
            color: Utils.color,
            child: ListView(
              children: [
                AppBar(
                  actions: [
                    IconButton(
                        icon: Icon(
                          Icons.logout,
                          color: Utils.white,
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
                    'About App',
                    style: TextStyle(color: Utils.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
