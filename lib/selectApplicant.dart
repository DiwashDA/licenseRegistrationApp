import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:license_online/api/service.dart';
import 'package:license_online/applicant.dart';
import 'package:license_online/applicationdetails.dart';
import 'package:license_online/newApplication.dart';
import 'package:license_online/utils.dart';

class SelectApplicant extends StatefulWidget {
  const SelectApplicant({Key key}) : super(key: key);

  @override
  _SelectApplicantState createState() => _SelectApplicantState();
}

class _SelectApplicantState extends State<SelectApplicant> {
  TextStyle style = TextStyle(
    fontSize: 16.0,
  );
  List<Applicant> applicants;

  bool isLoading = true;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    await ApiService().getApplicantList().then((value) async {
      applicants = (value as List)?.map((dynamic e) {
        return e == null ? null : Applicant.fromJson(e as Map<String, dynamic>);
      })?.toList();
      print(applicants.length.toString());
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Utils.bgImage(context),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
            color: Utils.color,
            child: Column(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).size.height * 0.16,
                    width: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        Utils.appBar('home', 'Select Applicant', context),
                        Expanded(
                          child: !isLoading
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: applicants.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Details(id:applicants[index].sId)));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Card(
                                          elevation: 5,
                                          //color: Colors.grey[100],
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.all(4.0),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment.start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment.start,
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .account_circle_outlined,
                                                                color: Colors.grey),
                                                            SizedBox(
                                                              width: 10.0,
                                                            ),
                                                            Expanded(
                                                                child: Text(
                                                              applicants[index]
                                                                  .applicantName,
                                                              style: style,
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow.ellipsis,
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.all(4.0),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment.start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment.start,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .location_on_outlined,
                                                              color: Colors.grey,
                                                            ),
                                                            SizedBox(
                                                              width: 10.0,
                                                            ),
                                                            Text(
                                                              applicants[index]
                                                                  .citizenshipNumber,
                                                              style: style,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.all(4.0),
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
                                                              applicants[index]
                                                                  .licenseType,
                                                              style: style,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  })
                              : Center(
                                  child: Container(child: CircularProgressIndicator())),
                        ),

                      ],
                    )),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NewApplication()));
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
