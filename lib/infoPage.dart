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
                Utils.appBar('home', 'About App', context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
