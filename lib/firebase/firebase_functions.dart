import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com_app/data_classes/ui_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';

getUserid() async {
  String? uid = FirebaseAuth.instance.currentUser?.uid;
  return uid.toString();
}

checkUserState() {
  if (FirebaseAuth.instance.currentUser?.uid == null) {
    return false;
  } else {
    return true;
  }
}

void addCart(
    String productname, String image, String price, String category) async {
  if (checkUserState() == true) {
    String? uid = await FirebaseAuth.instance.currentUser?.uid;
    CollectionReference users = FirebaseFirestore.instance.collection('Cart');
    users.doc('userdata').collection(uid.toString()).doc().set({
      'uid': uid.toString(),
      'productname': productname,
      'image': image,
      'price': price,
      'category': category,
    });
    createToast('Added to Cart');
  } else {
    createToast('PLease Login First');
  }
}

void addOrder(String username, String productname, String image, String price,
    String quantity, String method, String uid) {
  FirebaseFirestore.instance.collection('Orders').add({
    'username': username,
    'productname': productname,
    'image': image,
    'price': price,
    'quantity': quantity,
    'method': method,
    'uid': uid
  });
  createToast('Order Confirmed');
}

void updateData(
  String uid,
  String name,
  String address,
  String contact,
) async {
  FirebaseFirestore.instance.collection('Users').doc(uid).update({
    'username': name,
    'address': address,
    'contact': contact,
  });
  createToast('Data Updated');
}
