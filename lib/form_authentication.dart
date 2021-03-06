import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;

  AuthService(this._firebaseAuth);
  
  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();

  

  Future<String> logIn({String email, String pass}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: pass);
      return "signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  

  
}

Future<void> signUp(String userName, String email, String accType) async {
      CollectionReference users = FirebaseFirestore.instance.collection('users');
      FirebaseAuth auth = FirebaseAuth.instance;
      String uid = auth.currentUser.uid.toString();
      users.add({
        'username': userName,
        'email': email,
        'accType': accType,
        'uid': uid
      });
      return;
}

  Future signOut() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      return await auth.signOut();
    } catch(e) {

    }
  }

  