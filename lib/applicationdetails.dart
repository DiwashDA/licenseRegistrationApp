import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:license_online/api/service.dart';
import 'package:license_online/applicant.dart';
import 'package:license_online/utils.dart';

class Details extends StatefulWidget {
  const Details({Key key, this.id}) : super(key: key);
  final id;

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Applicant applicant;
  bool isLoading = true;
  Registration reg ;
  var newdate = new DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day+7);
  void initState() {
   apiHandler();
   print(newdate.toString());
    print(DateTime.now().toString());
    super.initState();
  }
  apiHandler()async{
    await ApiService().getAnApplicant(widget.id).then((value) {
      applicant = Applicant.fromJson(value);
    });
    setState(() {
      isLoading = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Utils.bgImage(context),
          Container(
            color: Colors.black.withOpacity(0.7),
            child: Column(
              children: [
                Utils.appBar("key", "Application Details", context),
                !isLoading
                    ? Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PageView(
                            scrollDirection: Axis.horizontal,
                            children: [applicationDetails(), schedule()],
                          ),
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
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
      child: ListView(
        children: [
          Center(child: Card(color: Colors.white70,child: Image.network(applicant.applicantPhoto))),
          Card(
            elevation: 0.5,
            color: Colors.white70,
            child: Column(
              children: [
                Text("Personal Information",style: TextStyle(fontSize: 18),),
                ListTile(
                  title: Text("Name :"),
                  subtitle: Text(applicant.applicantName),
                ),
                ListTile(
                  title: Text("Date Of Birth :"),
                  subtitle: Text(applicant.applicantDOB),
                ),
                ListTile(
                  title: Text("Gender :"),
                  subtitle: Text("Male"),
                ),
                ListTile(
                  title: Text("Citizenship Number :"),
                  subtitle: Text(applicant.citizenshipNumber),
                ),
              ],
            ),
          ),
          Card(
            elevation: 0.5,
            color: Colors.white70,
            child: Column(
              children: [
                Text("Address Information",style: TextStyle(fontSize: 18),),
                ListTile(
                  title: Text("Province :"),
                  subtitle: Text("Province no 3 "),
                ),
                ListTile(
                  title: Text("District :"),
                  subtitle: Text(applicant.applicantAddress),
                ),
                ListTile(
                  title: Text("VDC/Municipality :"),
                  subtitle: Text("Bhaktapur"),
                ),
                ListTile(
                  title: Text("Ward No :"),
                  subtitle: Text("5"),
                ),
                ListTile(
                  title: Text("Street Name :"),
                  subtitle: Text("Kamalbinayak"),
                ),
              ],
            ),
          ),
          Card(
            elevation: 0.5,
            color: Colors.white70,
            child: Column(
              children: [
                Text("Contact Information",style: TextStyle(fontSize: 18),),
                ListTile(
                  title: Text("Phone :"),
                  subtitle: Text(applicant.citizenshipNumber),
                ),
                ListTile(
                  title: Text("Email :"),
                  subtitle: Text("abc@gmail.com"),
                ),
              ],
            ),
          ),
          Card(
            elevation: 0.5,
            color:Colors.white70,
            child: Column(
              children: [
                Text("Transportation Office",style: TextStyle(fontSize: 18),),
                ListTile(
                  title: Text("Office :"),
                  subtitle: Text(applicant.transportationOffice),
                ),
                ListTile(
                  title: Text("License Type :"),
                  subtitle: Text(applicant.licenseType),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget schedule() {
    return Container(
      color: Colors.transparent,
      child: ListView(
        children: [
          Card(
            elevation: 0.5,
            color: Colors.white70,
            child: Column(
              children: [
                Text("Examination Information",style: TextStyle(fontSize: 18),),
                ListTile(
                  title: Text("Examination Date :"),
                  subtitle: Text(newdate.year.toString()+"-"+newdate.month.toString()+"-"+newdate.day.toString()),
                ),
                ListTile(
                  title: Text("Venue :"),
                  subtitle: Text(applicant.transportationOffice),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
