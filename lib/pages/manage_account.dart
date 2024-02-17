import 'package:e_com_app/firebase/firebase_functions.dart';
import 'package:flutter/material.dart';

class ManageAccount extends StatefulWidget {
  final String uid, contact, address, username;
  const ManageAccount(
      {super.key,
      required this.uid,
      required this.contact,
      required this.address,
      required this.username});

  @override
  State<ManageAccount> createState() => _ManageAccountState();
}

class _ManageAccountState extends State<ManageAccount> {
  @override
  Widget build(BuildContext context) {
    final fnametext = TextEditingController(text: widget.username);
    final addresstext = TextEditingController(text: widget.address);
    final contacttext = TextEditingController(text: widget.contact);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: const Text('Manage Account',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontFamily: 'curvemedium')),
        backgroundColor: Colors.black87,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
              //width: double.infinity,
            ),
            const Center(
              child: Text(
                'Update Account Info',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                'assets/images/login.png',
                height: 150,
                width: 150,
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: Column(
                children: [
                  Container(
                      //color: Colors.blue,
                      width: 360,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              width: 345,
                              child: TextField(
                                obscureText: false,
                                controller: fnametext,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.person_2_rounded),
                                  labelText: 'Full Name',
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
                                  prefixIcon: Icon(Icons.add_location_sharp),
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
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black87),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        )),
                      ),
                      onPressed: () {
                        updateData(widget.uid, fnametext.text.trim(),
                            addresstext.text.trim(), contacttext.text.trim());
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Confirm',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
