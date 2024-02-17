import 'package:e_com_app/data_classes/ui_functions.dart';
import 'package:e_com_app/pages/about.dart';
import 'package:e_com_app/pages/manage_account.dart';
import 'package:e_com_app/pages/orders_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  final String username, contact, address, email, uid;
  const ProfileView(
      {super.key,
      required this.username,
      required this.contact,
      required this.address,
      required this.email,
      required this.uid});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 80),
        child: Container(
          width: double.maxFinite,
          padding:
              const EdgeInsets.only(bottom: 30, top: 30, left: 20, right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.black26,
              ),
              color: Colors.transparent),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/login.png',
                height: 100,
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Hello',
                style: TextStyle(
                    color: Colors.black, fontSize: 28, fontFamily: 'curvebold'),
              ),
              Text(
                widget.username,
                style: const TextStyle(color: Colors.black, fontSize: 25),
              ),
              const Divider(
                color: Colors.black54,
                height: 40,
                thickness: 2,
                indent: 5,
                endIndent: 5,
              ),
              const Text(
                'E-mail',
                style: TextStyle(
                    color: Colors.black, fontSize: 24, fontFamily: 'curvebold'),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                widget.email,
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Contact',
                style: TextStyle(
                    color: Colors.black, fontSize: 24, fontFamily: 'curvebold'),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                widget.contact,
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Address',
                style: TextStyle(
                    color: Colors.black, fontSize: 24, fontFamily: 'curvebold'),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                widget.address,
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(
                    bottom: 20, top: 10, left: 5, right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    color: Colors.transparent),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => OrdersList(uid: widget.uid)));
                      },
                      label: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                      ),
                      icon: const Text(
                        'View Your Orders',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => ManageAccount(
                                  uid: widget.uid,
                                  contact: widget.contact,
                                  address: widget.address,
                                  username: widget.username,
                                )));
                      },
                      label: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                      ),
                      icon: const Text(
                        'Manage Account',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => const AboutPage()));
                      },
                      label: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                      ),
                      icon: const Text(
                        'About Us',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              Center(
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () {
                    showAlertDialog(BuildContext context) {
                      // set up the buttons
                      Widget cancelButton = ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black87),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          )),
                        ),
                        child: const Text("Cancel",
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      );
                      Widget yesButton = ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black87),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          )),
                        ),
                        child: const Text(
                          "Yes",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          createToast('Logged Out');
                          setState(() {});
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      );
                      AlertDialog alert = AlertDialog(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        title: const Text("Confirmation"),
                        content: const Text("Would you like to Logout?"),
                        actions: [
                          cancelButton,
                          yesButton,
                        ],
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    }

                    showAlertDialog(context);
                  },
                  icon: const Icon(
                    Icons.logout_rounded,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
