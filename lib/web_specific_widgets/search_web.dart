import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com_app/web_specific_widgets/product_details_web.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../modal_classes/search_modal.dart';

class SearchPageWeb extends StatefulWidget {
  const SearchPageWeb({super.key});

  @override
  State<SearchPageWeb> createState() => _SearchPageWebState();
}

class _SearchPageWebState extends State<SearchPageWeb> {
  String search = '';
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
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          // appBar: AppBar(
          //   toolbarHeight: 60,
          //   iconTheme: const IconThemeData(color: Colors.white),
          //   title: const Text('Search For Product',
          //       style: TextStyle(
          //           color: Colors.white,
          //           fontSize: 27,
          //           fontFamily: 'curvemedium')),
          //   backgroundColor: Colors.black87,
          // ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 30),
                    child: SizedBox(
                      width: 500,
                      child: TextField(
                        textCapitalization: TextCapitalization.sentences,
                        obscureText: false,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          labelText: 'Search',
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
                        onChanged: (value) {
                          setState(() {
                            search = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
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
                            .where((s) => s.name
                                .toLowerCase()
                                .contains(search.toLowerCase()))
                            .toList();
                        return GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisExtent: 210,
                                    crossAxisCount: count,
                                    crossAxisSpacing: 0,
                                    mainAxisSpacing: 30),
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              if (true) {
                                return MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      ProductDetailsWeb(
                                                        title: data[index].name,
                                                        image1:
                                                            data[index].image1,
                                                        image2:
                                                            data[index].image2,
                                                        image3:
                                                            data[index].image3,
                                                        desc: data[index]
                                                            .description,
                                                        price:
                                                            data[index].price,
                                                        category: data[index]
                                                            .category,
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
                                  ),
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
