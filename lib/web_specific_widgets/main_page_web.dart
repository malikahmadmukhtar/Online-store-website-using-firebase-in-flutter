import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com_app/web_specific_widgets/home_web_complete.dart';
import 'package:e_com_app/web_specific_widgets/profile_placeweb.dart';
import 'package:e_com_app/web_specific_widgets/search_web.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../firebase/firebase_functions.dart';
import '../main.dart';
import 'cart_web.dart';

class MainPageWeb extends StatefulWidget {
  const MainPageWeb({super.key});

  @override
  State<MainPageWeb> createState() => _MainPageWebState();
}

class _MainPageWebState extends State<MainPageWeb> {
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
    String userid = getId();
    var pages = [
      const HomePageWeb(),
      const CartWeb(),
      ProfileWeb(
          username: username,
          contact: contact,
          address: address,
          email: email,
          uid: userid),
      const SearchPageWeb()
    ];

    double screenWidth = MediaQuery.of(context).size.width;
    window.addEventListener("resize", (e) {
      setState(() {
        if (screenWidth < 650) {
          Navigator.of(context).pushReplacement(CupertinoPageRoute(
            builder: (context) => const Main(),
          ));
        }
      });
    });

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: InkWell(
              onTap: () {
                setState(() {
                  currentIndex = 0;
                });
              },
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
              onPressed: () {
                setState(() {
                  currentIndex = 0;
                });
              },
              child: const Text('Shopping Zone',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
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
                      setState(() {
                        currentIndex = 3;
                      });
                    }),
                const SizedBox(
                  width: 20,
                ),
                MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          currentIndex = 1;
                        });
                      },
                      child: const Text('Cart',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'curvemedium')),
                    )),
                const SizedBox(
                  width: 20,
                ),
                MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          currentIndex = 2;
                        });
                      },
                      child: const Text('Profile',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'curvemedium')),
                    )),
              ],
            ),
          ),
        ],
      ),
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
    );
  }
}
