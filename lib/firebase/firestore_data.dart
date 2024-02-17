import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

// getUserInfo(String uid) {
//   String username = '';
//   // String contact = '';
//   // String address = '';
//   // String email = '';
//   var data1;
//   StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
//     stream: FirebaseFirestore.instance.collection("Users").doc(uid).snapshots(),
//     builder: (context, snapshot) {
//       if (snapshot.hasData) {
//         // data1 = {
//         //   'username': snapshot.data!.get('username'),
//         //   'contact': snapshot.data!.get('contact'),
//         //   'address': snapshot.data!.get('address'),
//         //   'email': snapshot.data!.get('email')
//         // };
//         username = snapshot.data!.get('username');
//         // contact = snapshot.data!.get('contact');
//         // address = snapshot.data!.get('address');
//         // email = snapshot.data!.get('email');
//         return const SizedBox(
//           height: 0,
//         );
//       }
//       return const SizedBox(
//         height: 0,
//       );
//     },
//   );
//   return username;
// }
//
// // getUserName() async{
// //   var userid = FirebaseAuth.instance.currentUser?.uid;
// //   var data = await FirebaseFirestore.instance.collection('Users').doc(userid);
// //   String name;
// //   data.get().then((event) {
// //     name = event['username'];
// //     return name;
// //   });
// //
// //   StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
// //     stream: FirebaseFirestore.instance
// //         .collection("Cart")
// //         .doc('userdata')
// //         .collection(userid.toString())
// //         .snapshots(),
// //     builder: (context, snapshot) {
// //       if (snapshot.hasData) {
// //         return Placeholder();
// //       }
// //       return Placeholder();
// //     },
// //   );
// // }
