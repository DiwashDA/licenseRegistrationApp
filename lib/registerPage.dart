
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var confirmPass;
  String _chosenValue;

  TextEditingController dateController = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: formField('Full Name', Icon(Icons.account_circle), false, validator),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField<String>(
                iconSize: 0.0,
                  decoration:InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(width: 2.0, color: Colors.black),
                    ),
                    prefixIcon: Icon(Icons.location_on_outlined)
                  ) ,
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
                       color: Colors.grey[600],
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
                controller: dateController,
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
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(width: 2.0, color: Colors.black)
                  ),
                  prefixIcon: Icon(Icons.calendar_today),
                  labelText: 'Date of Birth'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: formField('Email', Icon(Icons.email_sharp), false, emailValidator)

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: formField('Contact', Icon(Icons.phone_android), false, contactValidator)

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: formField('Password', Icon(Icons.lock), true, passValidator)

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: formField('Confirm Password', Icon(Icons.lock), true, confirmpassValidator)
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  color: Colors.indigo[100],
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Register',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500,),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already Have an account?  ",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          InkWell(
            onTap: null,
            child: Text(
              "Log In",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue,
                  decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }
  Widget formField(String label,Widget icon,bool obs,String Function(String) validator){
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.orange),
          ),
          labelText: label,
          prefixIcon: icon,
      ),
      obscureText: true,
      validator: validator,
    );
  }
  String validator(String vali){
    if (vali!=null){
      return null;
    }
    else{
      return 'Password cannot be empty';
    }
  }
  String emailValidator(String email){
    if (RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email)) {
      return null;
    } else {
      return "Invalid Email !";
    }
  }
  String contactValidator(String cont){
    if (cont.isEmpty) {
      return 'Phone number (+xxx xxx-xxxxxxx)';
    } else if (cont.length>10 || cont.length<10) {
      return 'Invalid Phone Number !';
    }else
      return null;
  }
  String passValidator(String password){
    confirmPass=password;
    if(password.isEmpty){
      return "Required ";
    }else if(password.length<6) {
      return "Password should be 6 characters long";
    }else if(password.length>15) {
      return "Password should not be greater than 15 characters";
    }else
      return null;
  }
  String confirmpassValidator(String confirm){
    if(confirmPass!=confirm){
      return 'Must be same as above';
    }
    else{
      return null;
    }
  }

  }

