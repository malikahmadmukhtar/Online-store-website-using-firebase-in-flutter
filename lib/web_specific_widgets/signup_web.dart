import 'package:e_com_app/firebase/firebase_signup.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../data_classes/ui_functions.dart';

class SignupWeb extends StatefulWidget {
  const SignupWeb({super.key});

  @override
  State<SignupWeb> createState() => _SignupState();
}

class _SignupState extends State<SignupWeb> {
  final fnametext = TextEditingController();
  final lnametext = TextEditingController();
  final passtext = TextEditingController();
  final cpasstext = TextEditingController();
  final addresstext = TextEditingController();
  final contacttext = TextEditingController();
  final mailtext = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool mailisValid;
    mailisValid = EmailValidator.validate(mailtext.text.trim());
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 650,
              width: 500,
              padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
              decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: const BorderRadius.all(Radius.circular(40)),
                border: Border.all(
                  width: 3,
                  color: Colors.black26,
                ),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontFamily: 'curvebold',
                            color: Colors.black,
                            fontSize: 32,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Image.asset(
                          'assets/images/singup.png',
                          height: 120,
                          width: 120,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Column(
                        children: [
                          Container(
                              //color: Colors.blue,
                              width: 360,
                              height: 340,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        SizedBox(
                                          width: 170,
                                          child: TextField(
                                            keyboardType: TextInputType.text,
                                            controller: fnametext,
                                            decoration: const InputDecoration(
                                              prefixIcon: Icon(Icons.person),
                                              labelText: 'First name',
                                              contentPadding:
                                                  EdgeInsets.all(15),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(30.0),
                                                ),
                                              ),
                                            ),
                                            style:
                                                const TextStyle(fontSize: 18),
                                            maxLines: 1,
                                            minLines: 1,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        SizedBox(
                                          width: 170,
                                          child: TextField(
                                            controller: lnametext,
                                            decoration: const InputDecoration(
                                              // prefixIcon: Icon(Icons.person),
                                              labelText: 'Last name',
                                              contentPadding:
                                                  EdgeInsets.all(15),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(30.0),
                                                ),
                                              ),
                                            ),
                                            style:
                                                const TextStyle(fontSize: 18),
                                            maxLines: 1,
                                            minLines: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    SizedBox(
                                      width: 345,
                                      child: TextField(
                                        onChanged: (value) {
                                          setState(() {});
                                        },
                                        obscureText: false,
                                        controller: mailtext,
                                        decoration: const InputDecoration(
                                          prefixIcon: Icon(Icons.mail_rounded),
                                          labelText: 'Email',
                                          contentPadding: EdgeInsets.all(15),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(30.0),
                                            ),
                                          ),
                                        ),
                                        style: const TextStyle(fontSize: 18),
                                        maxLines: 1,
                                        minLines: 1,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    SizedBox(
                                      width: 345,
                                      child: TextField(
                                        obscureText: false,
                                        controller: passtext,
                                        decoration: const InputDecoration(
                                          prefixIcon: Icon(Icons.key),
                                          labelText: 'Password',
                                          contentPadding: EdgeInsets.all(15),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(30.0),
                                            ),
                                          ),
                                        ),
                                        style: const TextStyle(fontSize: 18),
                                        maxLines: 1,
                                        minLines: 1,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    SizedBox(
                                      width: 345,
                                      child: TextField(
                                        // keyboardType: TextInputType.number,
                                        obscureText: false,
                                        controller: cpasstext,
                                        decoration: const InputDecoration(
                                          prefixIcon: Icon(Icons.key_rounded),
                                          labelText: 'Confirm Password',
                                          contentPadding: EdgeInsets.all(15),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(30.0),
                                            ),
                                          ),
                                        ),
                                        style: const TextStyle(fontSize: 18),
                                        maxLines: 1,
                                        minLines: 1,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    SizedBox(
                                      width: 345,
                                      child: TextField(
                                        obscureText: false,
                                        controller: addresstext,
                                        decoration: const InputDecoration(
                                          prefixIcon:
                                              Icon(Icons.add_location_sharp),
                                          labelText: 'Address',
                                          contentPadding: EdgeInsets.all(15),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(30.0),
                                            ),
                                          ),
                                        ),
                                        style: const TextStyle(fontSize: 18),
                                        maxLines: 1,
                                        minLines: 1,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    SizedBox(
                                      width: 345,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        obscureText: false,
                                        controller: contacttext,
                                        decoration: const InputDecoration(
                                          prefixIcon: Icon(Icons.contact_mail),
                                          labelText: 'Contact#',
                                          contentPadding: EdgeInsets.all(15),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(30.0),
                                            ),
                                          ),
                                        ),
                                        style: const TextStyle(fontSize: 18),
                                        maxLines: 1,
                                        minLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 150,
                                height: 50,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color(0xff1e88e5)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                    )),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Back',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              SizedBox(
                                width: 150,
                                height: 50,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.black87),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                    )),
                                  ),
                                  onPressed: () {
                                    String username =
                                        '${fnametext.text.trim()} ${lnametext.text.trim()}';
                                    if (mailtext.text.trim().isEmpty) {
                                      createToast('Enter Email');
                                    } else if (mailisValid == false) {
                                      createToast('Enter Correct Email');
                                    } else if (passtext.text.trim().isEmpty) {
                                      createToast('Enter Password');
                                    }
                                    if (passtext.text.trim().length < 6) {
                                      createToast(
                                          'Password Should be at least 6 digits');
                                    } else if (passtext.text !=
                                        cpasstext.text) {
                                      createToast('Passwords Do not Match');
                                    } else if (fnametext.text.trim().isEmpty ||
                                        lnametext.text.trim().isEmpty) {
                                      createToast('Enter Complete Name');
                                    } else if (addresstext.text
                                        .trim()
                                        .isEmpty) {
                                      createToast('Enter Address');
                                    } else if (contacttext.text
                                        .trim()
                                        .isEmpty) {
                                      createToast('Enter Contact');
                                    } else if (contacttext.text.trim().length >
                                            11 ||
                                        contacttext.text.trim().length < 11) {
                                      createToast('Invalid Contact');
                                    } else {
                                      signUp(
                                          mailtext.text.trim(),
                                          passtext.text.trim(),
                                          username,
                                          addresstext.text.trim(),
                                          contacttext.text.trim());
                                      createToast('Signed Up');
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: const Text(
                                    'Sign-Up',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
