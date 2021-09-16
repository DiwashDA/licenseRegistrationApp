import 'package:flutter/material.dart';
import 'package:license_online/utils.dart';
class ChangePassword extends StatefulWidget {
  const ChangePassword({Key key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  var confirmPass;
  final _formKey=GlobalKey<FormState>();
  TextEditingController oldpw = TextEditingController();
  TextEditingController newpw = TextEditingController();
  TextEditingController cnewpw = TextEditingController();
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
                  AppBar(
                    leading: IconButton(onPressed: () {
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back)),

                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Utils.formField(oldpw, 'Old Password', Icon(Icons.lock_clock), true, (p0) => null)
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Utils.formField(newpw, 'New Password', Icon(Icons.lock_open_outlined), true, (p0) => null)
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Utils.formField(cnewpw, 'Confirm New Password', Icon(Icons.lock_open), true, (p0) => null)
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: InkWell(
                      onTap: (){
                        if(_formKey.currentState.validate()){
                          Navigator.pop(context);
                        }
                        else{
                          print('Not Validated');
                        }
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        color: Colors.green,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'Submit',
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
