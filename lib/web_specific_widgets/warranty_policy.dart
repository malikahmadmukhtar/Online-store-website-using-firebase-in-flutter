import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WarrantyPageWeb extends StatefulWidget {
  const WarrantyPageWeb({super.key});

  @override
  State<WarrantyPageWeb> createState() => _WarrantyPageWebState();
}

class _WarrantyPageWebState extends State<WarrantyPageWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black87,
        title: const Text(
          'Limited Warranty Policy',
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
                  'The warranty of products varies based on the product categories.',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 27,
                      fontFamily: 'curvebold'),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Mobile Phones.',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 27,
                      fontFamily: 'curvebold'),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                    'All the mobile phones sold at Shopping Zone are backed by a 1-year brand warranty unless specified.\nBrand warranty is claimable at the authorized warranty center of the brand, anywhere in Pakistan.\nTherefore, you dont have to ship the product back to our warehouse or worry about getting it fixed.\nYou can simply walk into your nearest authorized warranty center and you would be facilitated by a trained professional authorized by the brand.',
                    style: TextStyle(color: Colors.black, fontSize: 22)),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Accessories',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 27,
                      fontFamily: 'curvebold'),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                    'There is no Brand warranty for Ear Buds, Tablets, and Smart Watches unless specified by the brand itself.',
                    style: TextStyle(color: Colors.black, fontSize: 22)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
