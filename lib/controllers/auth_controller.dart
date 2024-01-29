import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUsers(String email, String fullName, String phoneNumber,
      String password) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty &&
          fullName.isNotEmpty &&
          phoneNumber.isNotEmpty &&
          password.isNotEmpty) {
        //create user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await _firestore.collection('buyers').doc(cred.user!.uid).set({
          'email': email,
          'fullName': fullName,
          'phoneNumber': phoneNumber,
          'buyerID': cred.user!.uid,
          'address': '',
        });
        res = 'success';
      } else {
        res = 'Fields must not be empty.';
      }
    } catch (e) {
      res = e.toString();
    }
    print(res);
    return res;
  }

  loginUsers(String email, String password) async {
    String res = 'error';

    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        res = 'Fields Must Not Be Empty.';
      }
      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
