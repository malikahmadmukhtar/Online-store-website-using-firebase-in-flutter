import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com_app/data_classes/ui_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<String?> login({
  required String email,
  required String password,
}) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return 'Success';
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      createToast('No user found for that email');
    } else if (e.code == 'wrong-password') {
      createToast('Incorrect Password');
    } else {
      createToast(e.message.toString());
    }
  } catch (e) {
    return e.toString();
  }
}


