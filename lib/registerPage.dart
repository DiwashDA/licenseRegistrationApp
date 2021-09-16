import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:license_online/api/service.dart';
import 'package:license_online/loginPage.dart';
import 'package:license_online/utils.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  var confirmPass;
  String _chosenValue;
  DateTime _selectedDate;

  _selectDate() async {
    DateTime newSelectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2040),
    );

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;

      dateController
        ..text = DateFormat.yMMMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: dateController.text.length,
            affinity: TextAffinity.upstream));
      setState(() {});
    }
  }

  TextEditingController fullnames = TextEditingController();
  TextEditingController addresses = TextEditingController();
  TextEditingController dobs = TextEditingController();
  TextEditingController emails = TextEditingController();
  TextEditingController phones = TextEditingController();
  TextEditingController passwords = TextEditingController();
  TextEditingController cpasswords = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Utils.bgImage(context),
          Container(
            color: Utils.color,
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Utils.appBar('key', 'Sign Up', context),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Utils.formField(fullnames, 'Full Name',
                        Icon(Icons.account_circle), false, validator),
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
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.black),
                            ),
                            prefixIcon: Icon(Icons.location_on_outlined)),
                        validator: (value) =>
                            value == null ? 'Choose your Location' : null,
                        isExpanded: true,
                        // focusColor:Colors.white,
                        value: _chosenValue,
                        //elevation: 5,
                        // style: TextStyle(color: Colors.white),

                        items: <String>[
                          'Kathmandu',
                          'Lalitpur',
                          'Bhaktapur',
                          'Dhankuta',
                          'Ilam',
                          'Jhapa',
                          'Khotang',
                          'Morang',
                          'Okhaldhunga',
                          'Panchthar',
                          'Sankhuwasabha',
                          'Solukhumbu',
                          'Sunsari',
                          'Taplejung',
                          'Tehrathum',
                          'Udayapur',
                          'Bara',
                          'Parsa',
                          'Dhanusha',
                          'Mahottari',
                          'Rautahat',
                          'Saptari',
                          'Sarlahi',
                          'Siraha',
                          'Chitwan',
                          'Dhading',
                          'Dolakha',
                          'Kavrepalanchok',
                          'Makwanpur',
                          'Nuwakot',
                          'Ramechhap',
                          'Rasuwa',
                          'Sindhuli',
                          'Sindhupalchok',
                          'Baglung',
                          'Gorkha',
                          'Kaski',
                          'Lamjung',
                          'Manang',
                          'Mustang',
                          'Myagdi',
                          'Nawalpur',
                          'Parbat',
                          'Syangja',
                          'Tanahun',
                          'Arghakhanchi',
                          'Banke',
                          'Bardiya',
                          'Dang',
                          'Eastern Rukum',
                          'Gulmi',
                          'Kapilavastu',
                          'Parasi',
                          'Palpa',
                          'Pyuthan',
                          'Rolpa',
                          'Rupandehi',
                          'Dailekh',
                          'Dolpa',
                          'Humla',
                          'Jajarkot',
                          'Jumla',
                          'Kalikot',
                          'Mugu',
                          'Salyan',
                          'Surkhet',
                          'Western Rukum',
                          'Achham',
                          'Baitadi',
                          'Bajhang',
                          'Bajura',
                          'Dadeldhura',
                          'Darchula',
                          'Doti',
                          'Kailali',
                          'Kanchanpur',
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
                          "Select your address",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        onChanged: (String value) async {
                          setState(() {
                            _chosenValue = value;
                          });
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      autocorrect: false,
                      controller: dobs,
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
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                BorderSide(width: 2.0, color: Colors.black)),
                        prefixIcon: Icon(Icons.calendar_today),
                        labelText: 'Date of Birth',
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Utils.formField(emails, 'Email',
                          Icon(Icons.email_sharp), false, emailValidator)),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Utils.formField(phones, 'Contact',
                          Icon(Icons.phone_android), false, contactValidator)),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Utils.formField(passwords, 'Password',
                          Icon(Icons.lock), true, passValidator)),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Utils.formField(cpasswords, 'Confirm Password',
                          Icon(Icons.lock), true, confirmpassValidator)),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: InkWell(
                      onTap: () {
                        if (_formKey.currentState.validate()) {
                          ApiService()
                              .register(
                                  addresses.text,
                                  passwords.text,
                                  fullnames.text,
                                  emails.text,
                                  dobs.text,
                                  phones.text,
                                  cpasswords.text)
                              .then((value) {
                            print(value);
                          });
                        } else {
                          print("Not Validated");
                        }
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        color: Colors.green,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Already have an account?",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, color: Utils.white),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  login(),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String validator(String vali) {
    if (vali.isEmpty) {
      return 'Name Required';
    } else {
      return null;
    }
  }

  String emailValidator(String email) {
    if (RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email)) {
      return null;
    } else {
      return "Invalid Email !";
    }
  }

  String contactValidator(String cont) {
    if (cont.isEmpty) {
      return 'Phone number (+xxx xxx-xxxxxxx)';
    } else if (cont.length > 10 || cont.length < 10) {
      return 'Invalid Phone Number !';
    } else
      return null;
  }

  String passValidator(String password) {
    confirmPass = password;
    if (password.isEmpty) {
      return "Password Required ";
    } else if (password.length < 6) {
      return "Password should be 6 characters long";
    } else if (password.length > 15) {
      return "Password should not be greater than 15 characters";
    } else
      return null;
  }

  String confirmpassValidator(String confirm) {
    if (confirmPass != confirm) {
      return 'Must be same as above';
    } else {
      return null;
    }
  }

  Widget login() {
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
        },
        child: Text(
          "Log In",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Utils.white,
              fontSize: 20,
              decoration: TextDecoration.underline),
        ),
      ),
    );
  }
}
