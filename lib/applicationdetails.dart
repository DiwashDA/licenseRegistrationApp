import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:license_online/utils.dart';

class Details extends StatefulWidget {
  const Details({Key key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Utils.bgImage(context),
          Container(
            color: Colors.black.withOpacity(0.5),
            child: Column(
              children: [
                Utils.appBar("key", "Application Details", context),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PageView(
                      scrollDirection: Axis.horizontal,
                      children: [applicationDetails(), schedule()],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget applicationDetails() {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [

        ],
      ),
    );
  }

  Widget schedule() {
    return Container(
      color: Colors.green,
    );
  }
}
