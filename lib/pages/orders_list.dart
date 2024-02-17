import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com_app/modal_classes/order_modal.dart';
import 'package:flutter/material.dart';

class OrdersList extends StatefulWidget {
  final String uid;
  const OrdersList({super.key, required this.uid});

  @override
  State<OrdersList> createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        toolbarHeight: 60,
        title: const Text('Your Orders',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontFamily: 'curvemedium')),
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30, top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ignore: avoid_unnecessary_containers
              Container(
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection("Orders")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<OrderModal> data = snapshot.data!.docs
                          .map((doc) => OrderModal(
                              uid: doc['uid'],
                              pname: doc['productname'],
                              pimage: doc['image'],
                              method: doc['method'],
                              price: doc['price'],
                              quantity: doc['quantity']))
                          .toList();
                      data = data.where((s) => s.uid == widget.uid).toList();
                      if (data.isEmpty) {
                        return const Center(
                          child: Text(
                            'No Orders Yet',
                            style: TextStyle(fontSize: 20),
                          ),
                        );
                      } else {
                        return ListView.builder(
                            itemExtent: 150.0,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: Colors.black26,
                                      ),
                                      color: Colors.white.withOpacity(0.4)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 6),
                                        child: Container(
                                          width: 125,
                                          height: 125,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      data[index].pimage),
                                                  fit: BoxFit.cover),
                                              color: Colors.transparent),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            // color: Colors.red,
                                            height: 50,
                                            width: 200,
                                            child: Text(
                                              data[index].pname,
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            'Quantity ${data[index].quantity}',
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            data[index].method,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            'Total Rs. ${data[index].price}',
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.deepOrangeAccent),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      }
                    }
                    if (snapshot.hasError) {
                      return const Text('Error');
                    } else {
                      return const Center(
                        child: SizedBox(
                            width: 100,
                            height: 100,
                            child: CircularProgressIndicator(
                              color: Color(0xffff6666),
                            )),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
