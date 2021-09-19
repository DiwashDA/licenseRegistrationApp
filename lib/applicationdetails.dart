import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:license_online/api/service.dart';
import 'package:license_online/applicant.dart';
import 'package:license_online/utils.dart';

class Details extends StatefulWidget {
  const Details({Key key,this.id}) : super(key: key);
final id;
  @override
  _DetailsState createState() => _DetailsState();
}


class _DetailsState extends State<Details> {
  @override
Applicant applicant;
  void initState() {
    ApiService().getAnApplicant(widget.id).then((value) {
      applicant = Applicant.fromJson(value);
      print(applicant.applicantName);
    });
    super.initState();
  }
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
