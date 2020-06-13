import 'package:flutter/material.dart';
import 'package:room_finances/screens/Shared/constants.dart';
import 'package:room_finances/screens/autenticate/register_screen.dart';
import 'package:room_finances/services/auth.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  
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
                  'Sign in',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),

                onPressed: () async {
                  
                  if(_formKey.currentState.validate()){

                    dynamic result = await _auth.signInwithEmailAndPassword(email, password);

                    if(result == null){
                      setState(() {
                        error = 'Username or Password not found'; //Todo: Correct error message
                      });
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

              SizedBox(height: 20.0,),

              Row(
                children: <Widget>[

                  Expanded(
                    child: Divider(thickness: 2.0, color: Colors.grey[400],),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'OR',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey[500],
                      ),
                      ),
                  ),

                  Expanded(
                    child: Divider(thickness: 2.0, color: Colors.grey[400],),
                  ),

                ],
              ),

              FlatButton(
                color: Colors.grey[200],
                child: Text('Register new User'),
                onPressed: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => RegisterScreen())
                  );
                },
              )

            ],
          ),
        ),
      )
    );
  }
}