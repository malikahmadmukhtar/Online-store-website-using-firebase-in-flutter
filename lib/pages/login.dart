import 'package:e_com_app/data_classes/ui_functions.dart';
import 'package:e_com_app/pages/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../firebase/firebase_login.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  final mailtext = TextEditingController();
  final passtext = TextEditingController();

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 75),
      child: Stack(
        children: [
          Container(
            height: 200,
            padding:
                const EdgeInsets.only(left: 15, top: 10, bottom: 10, right: 15),
            decoration: const BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(200),
                  bottomRight: Radius.circular(200)),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
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
                        color: Colors.white,
                        fontSize: 35,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                    width: double.infinity,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/login.png',
                      height: 150,
                      width: 150,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Column(
                    children: [
                      Container(
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
                                const SizedBox(height: 20),
                              ],
                            ),
                          )),
                      const SizedBox(height: 20),
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
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        fullscreenDialog: true,
                                        builder: (context) => Signup()));
                              },
                              child: const Text(
                                'Sign-Up',
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
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black87),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                )),
                              ),
                              onPressed: () async {
                                if (mailtext.text.isEmpty ||
                                    passtext.text.isEmpty) {
                                  createToast('Invalid Credentials');
                                } else {
                                  final message = await login(
                                      email: mailtext.text.trim(),
                                      password: passtext.text.trim());
                                  if (message!.contains('Success')) {
                                    createToast('Logged in');
                                    //Navigator.pop(context);
                                  }
                                }
                              },
                              child: const Text(
                                'Login',
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
        ],
      ),
    );
  }
}
