
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:license_online/utils.dart';

class NewApplication extends StatefulWidget {
  const NewApplication({Key key}) : super(key: key);

  @override
  _NewApplicationState createState() => _NewApplicationState();
}

class _NewApplicationState extends State<NewApplication> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var confirmPass;
  String _locationValue;
  String _newValue;
  String _vehicleValue;

  TextEditingController dateController = TextEditingController();

  TextEditingController birthDate = TextEditingController();

  // String _chosenValue;
  DateTime _selectedDate;

  _selectDate() async {
    DateTime newSelectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2022),
    );

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;

      birthDate
        ..text = DateFormat.yMMMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: birthDate.text.length, affinity: TextAffinity.upstream));
      setState(() {});
    }

  }
  File imageFile;
  TextEditingController fullname = TextEditingController();
  TextEditingController citizen = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController image = TextEditingController();
  TextEditingController office = TextEditingController();
  TextEditingController category = TextEditingController();



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
                AppBar(

                  leading: IconButton(onPressed: () {
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back)),

                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Utils.formField(fullname, 'Full Name', Icon(Icons.account_circle), false, (p0) => null)
                  // TextFormField(
                  //
                  //   decoration: InputDecoration(
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(8.0),
                  //       borderSide: BorderSide(color: Utils.white),
                  //     ),
                  //     prefixIcon: Icon(
                  //       Icons.account_circle,
                  //       color: Utils.white,
                  //     ),
                  //     labelText: 'Full Name',
                  //   ),
                  //   validator: (value) {
                  //     if (value.isEmpty) {
                  //       return "Name can't be empty";
                  //     }
                  //     return null;
                  //   },
                  // ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Utils.formField(citizen, 'Citizenship Number', Icon(Icons.wysiwyg_outlined), false, (p0) => null)
                  // TextFormField(
                  //   decoration: InputDecoration(
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(8.0),
                  //     ),
                  //     prefixIcon: Icon(
                  //       Icons.wysiwyg_outlined,
                  //       color: Colors.black,
                  //     ),
                  //     labelText: 'Citizenship Number',
                  //   ),
                  //   validator: (value) {
                  //     if (value.isEmpty) {
                  //       return "Required";
                  //     }
                  //     return null;
                  //   },
                  //   keyboardType: TextInputType.phone,
                  // ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Utils.formField(address, 'Address', Icon(Icons.location_on_outlined), false, (p0) => null)
                  // TextFormField(
                  //   decoration: InputDecoration(
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(8.0),
                  //       borderSide: BorderSide(color: Colors.orange),
                  //     ),
                  //     prefixIcon: Icon(
                  //       Icons.location_on_outlined,
                  //       color: Colors.black,
                  //     ),
                  //     labelText: 'Address',
                  //   ),
                  //   validator: (value) {
                  //     if (value.isEmpty) {
                  //       return "Required";
                  //     }
                  //     return null;
                  //   },
                  // ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    autocorrect: false,
                    controller: birthDate,
                    onTap: () {
                      _selectDate();
                    },
                    validator: (value) {
                      if (value.isEmpty || value.length < 1) {
                        return 'Choose Date';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.3),
                      focusColor: Colors.black,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      labelText: 'Date of Birth',
                      prefixIcon: Icon(Icons.calendar_today, color: Colors.black),
                      labelStyle:
                          TextStyle(decorationStyle: TextDecorationStyle.solid, color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<String>(
                      iconSize: 0.0,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.3),
                          focusColor: Colors.black,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                width: 2.0,
                              )),
                          prefixIcon: Icon(
                            Icons.person_sharp,
                            color: Colors.black,
                          )),
                      validator: (value) =>
                          value == null ? 'Select your Gender' : null,
                      isExpanded: true,
                      value: _newValue,
                      items: <String>['Male', 'Female', 'Other']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      hint: Text(
                        "Select your Gender",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      onChanged: (String value) async {
                        setState(() {
                          _newValue = value;
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                     borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey)

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.image),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Select Picture', style: TextStyle(fontSize: 16.0, color: Colors.black),),
                          ),
                          Expanded(
                            child: IconButton(
                              iconSize: 30.0,
                              icon: Icon(Icons.image_search),
                              onPressed: _getFromGallery,
                            ),
                          ),
                          IconButton(
                            iconSize: 30.0,
                            icon: Icon(Icons.camera_alt_outlined),
                            onPressed: _getFromCamera,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<String>(
                      iconSize: 0.0,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.3),
                          focusColor: Colors.black,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2.0),
                              borderRadius: BorderRadius.circular(10.0)),
                          prefixIcon: Icon(
                            Icons.location_on_outlined,
                            color: Colors.black,
                          )),
                      validator: (value) =>
                          value == null ? 'Choose your Location' : null,
                      isExpanded: true,
                      // focusColor:Colors.white,
                      value: _locationValue,
                      //elevation: 5,
                      // style: TextStyle(color: Colors.white),

                      items: <String>[
                        'Thulo Bharyang',
                        'Chabhill',
                        'Jagati',
                        'Karnali',
                        'Koshi License',
                        'Gandaki',
                        'Narayani License',
                        'Bagmati Vehicle',
                        'Lumbini',
                        'Mechi',
                        'Koshi',
                        'Sagarmatha',
                        'Janakpur',
                        'Narayani',
                        'Bagmati (License)',
                        'Bagmati (Motorcycle)',
                        'Lumbini License',
                        'Gandaki License',
                        'Rapti',
                        'Bheri',
                        'Seti',
                        'Mahakali',
                        'Dhaulagiri',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      hint: Text(
                        "Select Office",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      onChanged: (String value) async {
                        setState(() {
                          _locationValue = value;
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<String>(
                      iconSize: 0.0,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.3),
                          focusColor: Colors.black,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(width: 2.0)),
                          prefixIcon: Icon(
                            Icons.widgets_outlined,
                            color: Colors.black,
                          )),
                      validator: (value) =>
                          value == null ? 'Select Category' : null,
                      isExpanded: true,
                      // focusColor:Colors.white,
                      value: _vehicleValue,
                      //elevation: 5,
                      // style: TextStyle(color: Colors.white),

                      items: <String>[
                        'A - Motorcycle, Scooter, Moped',
                        'B - Car, Jeep, Delivery Van',
                        'C - Tempo, Auto Rickshaw',
                        'C1 - E-Rickshaw',
                        'D - Power Tiller',
                        'E - Tractor',
                        'F - MiniBus, Mini truck',
                        'G - Truck, Bus, Lorry',
                        'H - Road Roller',
                        'H1 - Dozer',
                        'H2 - Road Roller',
                        'I - Crane, Fire Brigade, Loader',
                        'I1 - Crane',
                        'I2 - Fire Brigade',
                        'I3 - Loader',
                        'J1 - Excavator',
                        'J2 - Backhoe Loader',
                        'J3 - Grader',
                        'J4 - Forklift',
                        'J5 - Other',
                        'K - Scooter, Moped'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      hint: Text(
                        "Select Category",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      onChanged: (String value) async {
                        setState(() {
                          _vehicleValue = value;
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){

                    },
                    child: Card(
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text("Submit", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: Colors.black),textAlign: TextAlign.center,),
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
  _getFromGallery() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
}
