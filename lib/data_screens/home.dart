import 'package:e_com_app/pages/search.dart';
import 'package:e_com_app/widgets/home_widgets/home_category.dart';
import 'package:e_com_app/widgets/home_widgets/home_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/home_widgets/home_slider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white60,
        appBar: AppBar(
          toolbarHeight: 60,
          title: const Text('Explore',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'curvemedium')),
          backgroundColor: Colors.black87,
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.search, color: Colors.white),
                padding: const EdgeInsets.only(right: 20),
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) => const SearchPage(),
                  ));
                }),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  const HomeSlider(),
                  //todo: animation is paused and should be resumed
                  const Padding(
                    padding: EdgeInsets.only(top: 245),
                    child: HomeCategory(),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 380),
                      child: Container(
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.black12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text('Trending Products',
                    style: TextStyle(fontFamily: 'curvemedium', fontSize: 23)),
              ),
              const SizedBox(
                height: 10,
              ),
              const HomeProducts()
            ],
          ),
        ));
  }
}
