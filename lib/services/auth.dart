import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Set up auth change user stream
  Stream<FirebaseUser> get user {
    return _auth.onAuthStateChanged;
  }

  //sing in anon
  Future signInAnon () async {
    try{

      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;

      return user;

    } catch(e) {

      print(e.toString());
      return null;

    }
  }

  //sign in with email and password
  Future signInwithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      return user;
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //register with email and password
  Future registerWithEmailAndPassword(String email, String password) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      return user;
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut () async {
    try{
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

}