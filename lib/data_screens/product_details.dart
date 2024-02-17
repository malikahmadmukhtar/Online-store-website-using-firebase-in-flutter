import 'package:e_com_app/firebase/firebase_functions.dart';
import 'package:e_com_app/widgets/product_widgets/products_slider.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final String title;
  final String image1;
  final String image2;
  final String image3;
  final String desc;
  final String price;
  final String category;

  const ProductDetails(
      {super.key,
      required this.title,
      required this.image1,
      required this.image2,
      required this.image3,
      required this.desc,
      required this.price,
      required this.category});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black87,
        title: const Text(
          'View Product',
          style: TextStyle(
              fontSize: 21, fontWeight: FontWeight.w400, color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
        onPressed: () {
          addCart(widget.title, widget.image1, widget.price, widget.category);
        },
        icon: const Icon(Icons.add_shopping_cart_rounded),
        label: const Text('Add to Cart'),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, bottom: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                      ),
                      child: ProductSlider(
                        image1: widget.image1,
                        image2: widget.image2,
                        image3: widget.image3,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                      padding:
                          const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                                fontSize: 23, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Rs. ${widget.price}',
                            style: const TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w400,
                                color: Colors.deepOrangeAccent),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          const Text(
                            'Winter Deal',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Colors.black45),
                          ),
                        ],
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                      padding:
                          const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Delivery',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'curvebold'),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Standard Delivery\nRs. 150',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Colors.black45),
                          ),
                        ],
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                      padding: const EdgeInsets.only(
                          left: 15, top: 10, bottom: 10, right: 10),
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Description',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'curvebold'),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            widget.desc,
                            style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w300,
                                color: Colors.black),
                          ),
                        ],
                      )),
                ),
              ],
            )),
      ),
    );
  }
}
