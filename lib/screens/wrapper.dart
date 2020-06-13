import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'autenticate/authenticate.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<FirebaseUser>(context);
    
    //returns either home or authenticate
    return user == null ? Authenticate(): Home();
  }
}