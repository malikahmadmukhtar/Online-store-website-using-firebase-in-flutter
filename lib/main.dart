import 'dart:async';
import 'package:e_com_app/pages/main_page.dart';
import 'package:e_com_app/provider_classes/order_choice_provider.dart';
import 'package:e_com_app/web_specific_widgets/main_page_web.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyBffSa7lO32t3LcB20r4Xu7W6_AEsQBF9I",
    appId: "1:269036190878:web:50a36cd90e67e8b9fd8f8f",
    messagingSenderId: "269036190878",
    storageBucket: "e-com-app-1e9de.appspot.com",
    projectId: "e-com-app-1e9de",
  ));
  runApp(
    ChangeNotifierProvider(
        create: (context) => OrderChoiceProvider(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:
                ThemeData(primaryColor: Colors.blue, fontFamily: 'curvemedium'),
            home: const Main())),
  );
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      double screenWidth = MediaQuery.of(context).size.width;
      if (screenWidth > 650) {
        Timer(
            const Duration(milliseconds: 2000), //todo change to 2000ms
            () => Navigator.pushReplacement(context,
                CupertinoPageRoute(builder: (context) => const MainPageWeb())));
      }
      if (screenWidth < 650) {
        Timer(
            const Duration(milliseconds: 2000),
            () => Navigator.pushReplacement(context,
                CupertinoPageRoute(builder: (context) => const Mainpage())));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDFE5F8),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              Image.asset(
                "assets/images/splash.png",
                width: 300,
              ),
              const SizedBox(
                height: 90,
              ),
              LoadingAnimationWidget.fourRotatingDots(
                  color: Colors.black87, size: 30)
            ],
          ),
        ),
      ),
    );
  }
}
