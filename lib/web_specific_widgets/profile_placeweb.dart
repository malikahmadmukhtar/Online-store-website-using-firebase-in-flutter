import 'package:e_com_app/web_specific_widgets/cart_usercheck_web.dart';
import 'package:flutter/material.dart';

class ProfileWeb extends StatefulWidget {
  final String username, contact, address, uid, email;

  const ProfileWeb(
      {super.key,
      required this.username,
      required this.contact,
      required this.address,
      required this.email,
      required this.uid});

  @override
  State<ProfileWeb> createState() => _ProfileWebState();
}

class _ProfileWebState extends State<ProfileWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: checkProfileUserWeb(widget.username, widget.contact,
            widget.address, widget.email, widget.uid));
  }
}
