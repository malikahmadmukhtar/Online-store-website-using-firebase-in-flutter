import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com_app/web_specific_widgets/category_list_web.dart';
import 'package:e_com_app/web_specific_widgets/home_slider_web.dart';
import 'package:e_com_app/web_specific_widgets/product_details_web.dart';
import 'package:e_com_app/web_specific_widgets/return_policy.dart';
import 'package:e_com_app/web_specific_widgets/warranty_policy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../modal_classes/search_modal.dart';
import '../widgets/home_widgets/home_category.dart';
import 'about_web.dart';

class HomePageWeb extends StatefulWidget {
  const HomePageWeb({super.key});

  @override
  State<HomePageWeb> createState() => _HomePageWebState();
}

class _HomePageWebState extends State<HomePageWeb> {
  int count = 5;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    window.addEventListener("resize", (e) {
      setState(() {
        // if (screenWidth < 950) {
        //   count = 5;
        // }
        if (screenWidth < 850) {
          count = 4;
        }
        if (screenWidth < 750) {
          count = 3;
        }
        if (screenWidth < 650) {
          count = 2;
        }
      });
    });

    // to get random category from list to stream builder
    List<String> name = [
      'Laptops',
      'Beauty',
      'Fashion',
      'Home Appliances',
      'Earbuds',
      'Gadgets',
      'Mobiles',
      'Watches'
    ];
    var randomCat = (name.toList()..shuffle()).first;

    return Scaffold(
        backgroundColor: Colors.white60,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Stack(
                children: [
                  HomeSliderWeb(),
                  //todo: animation is paused and should be resumed
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 30, bottom: 5, left: screenWidth / 8),
                child: const CategoryListWeb(),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
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
              const Padding(
                padding: EdgeInsets.only(left: 30, top: 30, bottom: 40),
                child: Text('Trending Products',
                    style: TextStyle(fontFamily: 'curvebold', fontSize: 24)),
              ),
              Container(
                padding: const EdgeInsets.only(left: 30, right: 30),
                width: double.infinity,
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection("Products")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 220,
                                  crossAxisCount: count,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 50),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetailsWeb(
                                                    title: snapshot
                                                        .data!.docs[index]
                                                        .get('Name'),
                                                    image1: snapshot
                                                        .data!.docs[index]
                                                        .get('Image1'),
                                                    image2: snapshot
                                                        .data!.docs[index]
                                                        .get('Image2'),
                                                    image3: snapshot
                                                        .data!.docs[index]
                                                        .get('Image3'),
                                                    desc: snapshot
                                                        .data!.docs[index]
                                                        .get('Description'),
                                                    price: snapshot
                                                        .data!.docs[index]
                                                        .get('Price'),
                                                    category: snapshot
                                                        .data!.docs[index]
                                                        .get('Category'),
                                                  )));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                            color: Colors.black26,
                                          ),
                                          color: Colors.transparent),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Image.network(
                                          snapshot.data!.docs[index]
                                              .get('Image1'),
                                          width: 180,
                                          height: 180,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Center(
                                  child: Container(
                                      height: 19,
                                      width: 180,
                                      child: Center(
                                        child: Text(
                                            snapshot.data!.docs[index]
                                                .get('Name'),
                                            style: const TextStyle(
                                              fontSize: 14,
                                            )),
                                      )),
                                ),
                              ],
                            );
                          });
                    }
                    if (snapshot.hasError) {
                      return const Text('Error');
                    } else {
                      return const Center(
                        child: SizedBox(
                            width: 100,
                            height: 100,
                            child: CircularProgressIndicator()),
                      );
                    }
                  },
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 30),
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
              Padding(
                padding: const EdgeInsets.only(left: 30, bottom: 40),
                child: Text('Explore $randomCat',
                    style:
                        const TextStyle(fontFamily: 'curvebold', fontSize: 24)),
              ),
              Container(
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection('Products')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<SearchList> data = snapshot.data!.docs
                          .map((doc) => SearchList(
                              name: doc['Name'],
                              image1: doc['Image1'],
                              image2: doc['Image2'],
                              image3: doc['Image3'],
                              description: doc['Description'],
                              price: doc['Price'],
                              category: doc['Category']))
                          .toList();
                      data = data
                          .where((s) => s.category
                              .toLowerCase()
                              .contains(randomCat.toLowerCase()))
                          .toList();
                      return GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 210,
                                  crossAxisCount: count,
                                  crossAxisSpacing: 0,
                                  mainAxisSpacing: 10),
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            if (true) {
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetailsWeb(
                                                    title: data[index].name,
                                                    image1: data[index].image1,
                                                    image2: data[index].image2,
                                                    image3: data[index].image3,
                                                    desc:
                                                        data[index].description,
                                                    price: data[index].price,
                                                    category:
                                                        data[index].category,
                                                  )));
                                    },
                                    child: Container(
                                      width: 180,
                                      height: 180,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                            color: Colors.black26,
                                          ),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  data[index].image1),
                                              fit: BoxFit.cover),
                                          color: Colors.transparent),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Container(
                                      height: 19,
                                      width: 180,
                                      child: Center(
                                        child: Text(data[index].name),
                                      )),
                                ],
                              );
                            }
                          });
                    }
                    if (snapshot.hasError) {
                      return const Text('Error');
                    } else {
                      return const Center(
                        child: SizedBox(
                            width: 100,
                            height: 100,
                            child: CircularProgressIndicator()),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 240,
                width: screenWidth,
                color: Colors.black87,
                padding: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 15),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Shopping Zone',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontFamily: 'curvemedium')),
                        const SizedBox(
                          height: 30,
                        ),
                        MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const AboutPageWeb()));
                              },
                              child: const Text('About Us',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontFamily: 'curveregular')),
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const WarrantyPageWeb()));
                              },
                              child: const Text('Warranty Policy',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontFamily: 'curveregular')),
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const ReturnPageWeb()));
                              },
                              child: const Text('Return Policy',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontFamily: 'curveregular')),
                            )),
                      ],
                    ),
                    SizedBox(
                      width: screenWidth - 600,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text('Get the App',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontFamily: 'curveregular')),
                        const SizedBox(
                          height: 5,
                        ),
                        MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              child: Image.asset(
                                'assets/images/play.png',
                                width: 130,
                              ),
                            )),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text('Our Social Accounts',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontFamily: 'curveregular')),
                        const SizedBox(
                          height: 8,
                        ),
                        MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      var url = Uri.parse(
                                          "https://www.facebook.com/mlik.malik.503");
                                      launchUrl(url);
                                    },
                                    icon: const Icon(Icons.facebook_rounded)),
                                IconButton(
                                    onPressed: () {
                                      var url = Uri.parse(
                                          "https://instagram.com/ya_its_ahmad/");
                                      launchUrl(url);
                                    },
                                    icon:
                                        const Icon(FontAwesomeIcons.instagram)),
                                IconButton(
                                    onPressed: () {
                                      var url = Uri.parse(
                                          "https://wa.me/+923462369945");
                                      launchUrl(url);
                                    },
                                    icon:
                                        const Icon(FontAwesomeIcons.whatsapp)),
                              ],
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
