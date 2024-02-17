import 'package:e_com_app/widgets/profile_widgets/profile_user_check.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final String username, contact, address, email, uid;
  const Profile(
      {super.key,
      required this.username,
      required this.contact,
      required this.address,
      required this.email,
      required this.uid});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          title: const Text('Your Profile',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'curvemedium')),
          backgroundColor: Colors.black87,
        ),
        body: checkProfileUser(widget.username, widget.contact, widget.address,
            widget.email, widget.uid));
  }
}
