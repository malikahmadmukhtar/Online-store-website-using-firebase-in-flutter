import 'package:e_com_app/data_classes/ui_functions.dart';
import 'package:e_com_app/pages/signup.dart';
import 'package:e_com_app/web_specific_widgets/signup_web.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../firebase/firebase_login.dart';
import '../main.dart';

class LoginWeb extends StatefulWidget {
  const LoginWeb({super.key});

  @override
  State<LoginWeb> createState() => _LoginState();
}

class _LoginState extends State<LoginWeb> {
  final mailtext = TextEditingController();
  final passtext = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 30),
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 500,
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
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Center(
                          child: Text(
                            'Login to Proceed',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                          width: double.infinity,
                        ),
                        Center(
                          child: Image.asset(
                            'assets/images/login.png',
                            height: 120,
                            width: 120,
                          ),
                        ),
                        const SizedBox(height: 35),
                        Center(
                          child: Container(
                              //color: Colors.blue,
                              width: 360,
                              height: 200,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 345,
                                      child: TextField(
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
                                        keyboardType: TextInputType.number,
                                        obscureText: true,
                                        controller: passtext,
                                        decoration: const InputDecoration(
                                          prefixIcon: Icon(Icons.key_rounded),
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
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 150,
                                          height: 50,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      const Color(0xff1e88e5)),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25.0),
                                              )),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  CupertinoPageRoute(
                                                      fullscreenDialog: true,
                                                      builder: (context) =>
                                                          const SignupWeb()));
                                            },
                                            child: const Text(
                                              'Sign-Up',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
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
                                            onPressed: () async {
                                              if (mailtext.text.isEmpty ||
                                                  passtext.text.isEmpty) {
                                                createToast(
                                                    'Invalid Credentials');
                                              } else {
                                                final message = await login(
                                                    email: mailtext.text.trim(),
                                                    password:
                                                        passtext.text.trim());
                                                if (message!
                                                    .contains('Success')) {
                                                  createToast('Logged in');
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                          CupertinoPageRoute(
                                                    builder: (context) =>
                                                        const Main(),
                                                  ));
                                                  //Navigator.pop(context);
                                                }
                                              }
                                            },
                                            child: const Text(
                                              'Login',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )),
                        ),
                      ],
                    ),
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
