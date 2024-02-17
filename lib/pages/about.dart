import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black87,
        title: const Text(
          'About Us',
          style: TextStyle(
              fontSize: 23, fontWeight: FontWeight.w400, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
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
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/appicon.png',
                    height: 150,
                    width: 150,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Center(
                  child: Text('Shopping Zone',
                      style: TextStyle(color: Colors.black, fontSize: 27)),
                ),
                const Divider(
                  color: Colors.black54,
                  height: 60,
                  thickness: 2,
                  indent: 5,
                  endIndent: 5,
                ),
                const Text(
                  'Developed By',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'curvebold'),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Ahmad Malik',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Contact Us',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'curvebold'),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Ahmad Malik',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        var url =
                            Uri.parse("https://facebook.com/mlik.malik.503");
                        launchUrl(url);
                      },
                      child: Image.asset(
                        "assets/images/facebook.png",
                        width: 70,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        var url = Uri.parse("https://wa.me/+923462369945");
                        launchUrl(url);
                      },
                      child: Image.asset(
                        "assets/images/whatsapp.png",
                        width: 70,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        var url =
                            Uri.parse("https://instagram.com/ya_its_ahmad/");
                        launchUrl(url);
                      },
                      child: Image.asset(
                        "assets/images/instagram.png",
                        width: 70,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Center(
                  child: Text(
                    'Version: 1.0.0',
                    style: TextStyle(color: Colors.black54),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
