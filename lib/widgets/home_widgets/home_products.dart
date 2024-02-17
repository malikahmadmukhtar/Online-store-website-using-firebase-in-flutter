import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data_screens/product_details.dart';

class HomeProducts extends StatefulWidget {
  const HomeProducts({super.key});

  @override
  State<HomeProducts> createState() => _HomeProductsState();
}

class _HomeProductsState extends State<HomeProducts> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection("Products").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 210,
                    crossAxisCount: 2,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 13),
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => ProductDetails(
                                    title:
                                        snapshot.data!.docs[index].get('Name'),
                                    image1: snapshot.data!.docs[index]
                                        .get('Image1'),
                                    image2: snapshot.data!.docs[index]
                                        .get('Image2'),
                                    image3: snapshot.data!.docs[index]
                                        .get('Image3'),
                                    desc: snapshot.data!.docs[index]
                                        .get('Description'),
                                    price:
                                        snapshot.data!.docs[index].get('Price'),
                                    category: snapshot.data!.docs[index]
                                        .get('Category'),
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
                                  image: NetworkImage(
                                      snapshot.data!.docs[index].get('Image1')),
                                  fit: BoxFit.cover),
                              color: Colors.transparent),
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
                              child:
                                  Text(snapshot.data!.docs[index].get('Name')),
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
                  width: 100, height: 100, child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }
}
