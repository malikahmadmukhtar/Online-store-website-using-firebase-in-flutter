import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com_app/data_classes/ui_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data_screens/order_screen.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  getId() {
    final User? user = FirebaseAuth.instance.currentUser;
    final uid = user?.uid;
    return uid;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String userid = getId();

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 15, bottom: 10, right: 5, left: 5),
        child: Column(
          children: [
            Container(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection("Cart")
                    .doc('userdata')
                    .collection(userid.toString())
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.docs.isEmpty) {
                      return const Center(
                        child: Text(
                          'No Items in Cart Yet',
                          style: TextStyle(fontSize: 20),
                        ),
                      );
                    } else {
                      return ListView.builder(
                          itemExtent: 150.0,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: Colors.black26,
                                    ),
                                    color: Colors.white.withOpacity(0.4)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: Container(
                                        width: 125,
                                        height: 125,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(snapshot
                                                    .data!.docs[index]
                                                    .get('image')),
                                                fit: BoxFit.cover),
                                            color: Colors.transparent),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      // crossAxisAlignment:
                                      //     CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // color: Colors.red,
                                          height: screenHeight / 11,
                                          width: screenWidth * 0.5,
                                          child: Text(
                                            snapshot.data!.docs[index]
                                                .get('productname'),
                                            style: const TextStyle(
                                              fontSize: 17,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 40,
                                              width: screenWidth / 3,
                                              child: ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.black87),
                                                  shape: MaterialStateProperty
                                                      .all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  )),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      CupertinoPageRoute(
                                                          builder: (context) =>
                                                              OrderScreen(
                                                                title: snapshot
                                                                    .data!
                                                                    .docs[index]
                                                                    .get(
                                                                        'productname'),
                                                                price: snapshot
                                                                    .data!
                                                                    .docs[index]
                                                                    .get(
                                                                        'price'),
                                                                image: snapshot
                                                                    .data!
                                                                    .docs[index]
                                                                    .get(
                                                                        'image'),
                                                                uid: userid
                                                                    .toString(),
                                                                docid: snapshot
                                                                    .data!
                                                                    .docs[index]
                                                                    .reference,
                                                              )));
                                                },
                                                child: const Text(
                                                  'Order now',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                //Transaction to delete Product
                                                FirebaseFirestore.instance
                                                    .runTransaction((Transaction
                                                        myTransaction) async {
                                                  await myTransaction.delete(
                                                      snapshot.data!.docs[index]
                                                          .reference);
                                                });
                                                createToast('Item Removed');
                                              },
                                              icon: const Icon(Icons.delete,
                                                  color: Colors.black),
                                              iconSize: 25,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                  }
                  if (snapshot.hasError) {
                    return const Text('Error');
                  } else {
                    return const Center(
                      child: SizedBox(
                          width: 70,
                          height: 70,
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          )),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
