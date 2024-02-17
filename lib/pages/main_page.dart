import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com_app/data_screens/categories.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../data_screens/cart.dart';
import '../data_screens/home.dart';
import '../data_screens/user_profile.dart';
import '../firebase/firebase_functions.dart';
import '../main.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  var currentIndex = 0;

  getId() {
    if (checkUserState() == true) {
      final User? user = FirebaseAuth.instance.currentUser;
      final uid = user?.uid;
      return uid;
    } else {
      return 'nullsafety';
    }
  }

  String username = '';
  String contact = '';
  String address = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    window.addEventListener("resize", (e) {
      setState(() {
        if (screenWidth > 700) {
          Navigator.of(context).pushReplacement(CupertinoPageRoute(
            builder: (context) => const Main(),
          ));
        }
      });
    });

    String userid = getId();
    var pages = [
      const Home(),
      const Categories(),
      const Cart(),
      Profile(
          username: username,
          contact: contact,
          address: address,
          email: email,
          uid: userid)
    ];

    return Scaffold(
      body: Stack(
        children: [
          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection("Users")
                .doc(userid.toString())
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                username = snapshot.data!.get('username');
                contact = snapshot.data!.get('contact');
                address = snapshot.data!.get('address');
                email = snapshot.data!.get('email');
                return const SizedBox(
                  height: 0,
                );
              }
              return const SizedBox(
                height: 0,
              );
            },
          ),
          pages[currentIndex],
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10, bottom: 8, top: 7),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black87,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                  // rippleColor: const Color(0xffff6666).withOpacity(0.6),
                  // hoverColor: const Color(0xffff6666).withOpacity(0.6),
                  gap: 2,
                  tabActiveBorder: Border.all(color: Colors.white, width: 2),
                  activeColor: Colors.white,
                  iconSize: 20,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: const Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.black87,
                  color: Colors.white,
                  tabs: const [
                    GButton(
                      icon: Icons.home_rounded,
                      text: 'Home ',
                    ),
                    GButton(
                      icon: Icons.grid_view_rounded,
                      text: 'Categories',
                    ),
                    GButton(
                      icon: Icons.shopping_cart_rounded,
                      text: ' Cart',
                    ),
                    GButton(
                      icon: Icons.person_rounded,
                      text: 'Profile',
                    ),
                  ],
                  selectedIndex: currentIndex,
                  onTabChange: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
