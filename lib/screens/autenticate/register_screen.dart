import 'package:flutter/material.dart';
import 'package:room_finances/screens/Shared/constants.dart';
import 'package:room_finances/services/auth.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field states
  String email = '';
  String password = '';
  String error = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Register new User'),
      ),

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              //some image

              //Form field for email
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val.isEmpty ? 'Enter an email': null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),

              SizedBox(height: 20.0,),

              //form field for password
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                validator: (val) => val.length < 6 ? 'Enter a password of 6+ chars': null,
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),

              SizedBox(height: 20.0,),

              RaisedButton(
                color: Colors.lightBlue,
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),

                onPressed: () async {
                  
                  if(_formKey.currentState.validate()){

                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);

                    if(result == null){
                      setState(() {
                        error = 'Please supply a valid Email'; //Todo: Correct error message
                      });
                    } else {
                      Navigator.pop(context);
                    }
                  }
                },
              ),

              SizedBox(height: 20.0,),

              Text(
                error,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14.0,
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}