import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com_app/data_screens/product_details.dart';
import 'package:e_com_app/web_specific_widgets/product_details_web.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../modal_classes/search_modal.dart';

class CategoryViewWeb extends StatefulWidget {
  final String title;

  const CategoryViewWeb({super.key, required this.title});

  @override
  State<CategoryViewWeb> createState() => _CategoryViewWebState();
}

class _CategoryViewWebState extends State<CategoryViewWeb> {
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

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black87,
        title: Text(
          widget.title,
          style: const TextStyle(
              fontSize: 21, fontWeight: FontWeight.w400, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 5, right: 5, bottom: 10),
        child: Container(
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream:
                FirebaseFirestore.instance.collection('Products').snapshots(),
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
                        .contains(widget.title.toLowerCase()))
                    .toList();
                return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ProductDetailsWeb(
                                          title: data[index].name,
                                          image1: data[index].image1,
                                          image2: data[index].image2,
                                          image3: data[index].image3,
                                          desc: data[index].description,
                                          price: data[index].price,
                                          category: data[index].category,
                                        )));
                              },
                              child: Container(
                                width: 180,
                                height: 180,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: Colors.black26,
                                    ),
                                    image: DecorationImage(
                                        image: NetworkImage(data[index].image1),
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
      ),
    );
  }
}
