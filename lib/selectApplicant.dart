import 'package:flutter/material.dart';
import 'package:license_online/applicationdetails.dart';
import 'package:license_online/newApplication.dart';
import 'package:license_online/utils.dart';


class SelectApplicant extends StatefulWidget {
  const SelectApplicant({Key key}) : super(key: key);

  @override
  _SelectApplicantState createState() => _SelectApplicantState();
}

class _SelectApplicantState extends State<SelectApplicant> {
  List<Map> data = [
    {'name': 'Diwash Adhikari', 'address': 'Kamalbinayak', 'Gender': 'Male'},
    {'name': 'Diwash Adhikari', 'address': 'Kamalbinayak', 'Gender': 'Male'},
  ];
  TextStyle style = TextStyle(
    fontSize: 16.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Utils.bgImage(context),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
            color:Utils.color,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Utils.appBar('home', 'Select Applicant', context),
                  ListView.builder(
                    shrinkWrap: true,
                      itemCount: data.length + 1,
                      itemBuilder: (context, index) {
                        if (index == data.length) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewApplication()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                color: Colors.green,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    '+ New Applicant',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Details()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                color: Colors.grey[100],
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Icon(Icons.account_circle_outlined,
                                                      color: Colors.grey),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Expanded(
                                                      child: Text(
                                                    data[index]['name'],
                                                    style: style,
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                  )),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.location_on_outlined,
                                                    color: Colors.grey,
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Text(
                                                    data[index]['address'],
                                                    style: style,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.person,
                                                    color: Colors.grey,
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Text(
                                                    data[index]['Gender'],
                                                    style: style,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                          onTap: () {},
                                          child: Icon(Icons.more_vert)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      }),
                ],
              )),
        ],
      ),
    );
  }
}
