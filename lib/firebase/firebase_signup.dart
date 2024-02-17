import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com_app/data_classes/ui_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';

signUp(String email, String password, String name, String address,
    String contact) async {
  if (await checkIfEmailInUse(email) == true) {
    createToast('Email Already in use');
    await FirebaseAuth.instance.signOut();
  } else {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }
  String? uid = await FirebaseAuth.instance.currentUser?.uid;
  addData(uid!, name, address, contact, email);
}

void addData(
  String uid,
  String name,
  String address,
  String contact,
  String email,
) async {
  FirebaseFirestore.instance.collection('Users').doc(uid).set({
    'username': name,
    'address': address,
    'contact': contact,
    'email': email,
  });
  await FirebaseAuth.instance.signOut();
  createToast('Account Created');
}

Future<bool> checkIfEmailInUse(String email) async {
  try {
    // Fetch sign-in methods for the email address
    final list = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);

    // In case list is not empty
    if (list.isNotEmpty) {
      // Return true because there is an existing
      // user using the email address
      return true;
    } else {
      // Return false because email adress is not in use
      return false;
    }
  } catch (error) {
    // Handle error
    // ...
    return true;
  }
}
