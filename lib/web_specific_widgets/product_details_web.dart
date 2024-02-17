import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com_app/web_specific_widgets/login_web.dart';
import 'package:e_com_app/web_specific_widgets/product_slider_web.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../data_classes/ui_functions.dart';
import '../firebase/firebase_functions.dart';

class ProductDetailsWeb extends StatefulWidget {
  final String title;
  final String image1;
  final String image2;
  final String image3;
  final String desc;
  final String price;
  final String category;

  const ProductDetailsWeb(
      {super.key,
      required this.title,
      required this.image1,
      required this.image2,
      required this.image3,
      required this.desc,
      required this.price,
      required this.category});

  @override
  State<ProductDetailsWeb> createState() => _ProductDetailsWebState();
}

class _ProductDetailsWebState extends State<ProductDetailsWeb> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    void addCartWeb(
        String productname, String image, String price, String category) async {
      if (checkUserState() == true) {
        String? uid = await FirebaseAuth.instance.currentUser?.uid;
        CollectionReference users =
            FirebaseFirestore.instance.collection('Cart');
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
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const LoginWeb(),
        ));
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: InkWell(
              onTap: () {},
              child: Image.asset(
                'assets/images/appicon.png',
                height: 50,
                width: 50,
              ),
            ),
          ),
        ),
        toolbarHeight: 70,
        title: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: TextButton(
              onPressed: () {},
              child: const Text('Shopping Zone',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'curvemedium')),
            )),
        backgroundColor: Colors.black87,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Row(
              children: [
                IconButton(
                    icon: const Icon(Icons.search, color: Colors.white),
                    padding: const EdgeInsets.only(right: 20),
                    onPressed: () {
                      // Navigator.of(context).push(CupertinoPageRoute(
                      //   builder: (context) => const SearchPage(),
                      // ));
                    }),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(
                right: 40, left: screenWidth / 9, bottom: 80, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Home > ${widget.category}',
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: 450,
                          width: 450,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                          ),
                          child: ProductSliderWeb(
                            image1: widget.image1,
                            image2: widget.image2,
                            image3: widget.image3,
                          )),
                      const SizedBox(
                        width: 70,
                      ),
                      Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.only(
                                  left: 15, top: 40, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                // border: Border.all(
                                //   color: Colors.black26,
                                // ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      widget.title,
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    'Rs. ${widget.price}',
                                    style: const TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.deepOrangeAccent),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  const Text(
                                    'Winter Deal',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black45),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  const Text(
                                    '15% off',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black45),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Delivery',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'curvebold'),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  const Text(
                                    'Standard Delivery\nRs. 150',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black45),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Availability',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'curvebold'),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  const Text(
                                    'In Stock',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black45),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  SizedBox(
                                    width: 250,
                                    height: 50,
                                    child: TextButton.icon(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.black87),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        )),
                                      ),
                                      onPressed: () {
                                        addCartWeb(widget.title, widget.image1,
                                            widget.price, widget.category);
                                      },
                                      icon: const Icon(
                                        Icons.add_shopping_cart_rounded,
                                        color: Colors.white,
                                      ),
                                      label: const Text(
                                        'Add to Cart',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                    width: screenWidth / 1.35,
                    padding: EdgeInsets.only(
                        left: 15, top: 10, bottom: 10, right: screenWidth / 10),
                    //width: screenWidth - 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.black26,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Description',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'curvebold'),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          widget.desc,
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                              color: Colors.black),
                        ),
                      ],
                    )),
              ],
            )),
      ),
    );
  }
}
