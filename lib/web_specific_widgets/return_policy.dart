import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ReturnPageWeb extends StatefulWidget {
  const ReturnPageWeb({super.key});

  @override
  State<ReturnPageWeb> createState() => _ReturnPageWebState();
}

class _ReturnPageWebState extends State<ReturnPageWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black87,
        title: const Text(
          'Returns Policy',
          style: TextStyle(
              fontSize: 23, fontWeight: FontWeight.w400, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Container(
            //width: 800,
            padding: const EdgeInsets.only(
                bottom: 20, top: 20, left: 100, right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                // border: Border.all(
                //   color: Colors.black26,
                // ),
                color: Colors.transparent),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Free 7 Days Returns',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 27,
                      fontFamily: 'curvebold'),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                    'Our returns policy ensures your satisfaction every step of the way. \nWith a hassle-free process, you can return items within 7 days for a full refund. \nWe accept returns for any reason, from sizing issues to simply changing your mind. \nItems must be in their original condition for a smooth return experience. \nEnjoy free return shipping on all eligible products. \nNeed assistance? Our dedicated customer support team is here to help you through the process. \nShop confidently knowing your satisfaction is our priority',
                    style: TextStyle(color: Colors.black, fontSize: 22)),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'How can I process the return of my Product?',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 27,
                      fontFamily: 'curvebold'),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                    '1. Contact us on the given Contacts.\n2. Mention complete details of your issue.\n3.The claim should be made within 3 days of accepting the delivery package.\n4.The opening of the company flyer should be included in the unboxing video.',
                    style: TextStyle(color: Colors.black, fontSize: 22)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
