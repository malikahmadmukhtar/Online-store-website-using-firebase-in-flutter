import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com_app/widgets/order_screen_widgets/order_size_color_choice.dart';
import 'package:flutter/material.dart';
import '../firebase/firebase_functions.dart';

class OrderScreenWeb extends StatefulWidget {
  final String title, image, price, uid, category;
  var docid;

  OrderScreenWeb(
      {super.key,
      required this.title,
      required this.image,
      required this.price,
      required this.uid,
      required this.docid,
      required this.category});

  @override
  State<OrderScreenWeb> createState() => _OrderScreenWebState();
}

class _OrderScreenWebState extends State<OrderScreenWeb> {
  String dropdownvalue = 'Cash On Delivery';
  String username = '';

  int counter = 1;

  var dropdownitems = [
    'Cash On Delivery',
    // 'Credit Card',
    // 'JazzCash',
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    int total = int.parse(widget.price) * counter + 200;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        toolbarHeight: 60,
        title: const Text('Confirm Order',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontFamily: 'curvemedium')),
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Container(
            width: screenWidth,
            padding: EdgeInsets.only(
                bottom: 30, top: 30, left: screenWidth / 8, right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.black26,
                ),
                color: Colors.transparent),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection("Users")
                      .doc(widget.uid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      username = snapshot.data!.get('username');
                      return const SizedBox(
                        height: 0,
                      );
                    }
                    return const SizedBox(
                      height: 0,
                    );
                  },
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: screenWidth / 8),
                        width: 400,
                        height: 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            image: DecorationImage(
                                image: NetworkImage(widget.image),
                                fit: BoxFit.cover),
                            color: Colors.transparent),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            // border: Border.all(
                            //   color: Colors.black26,
                            // ),
                            color: Colors.transparent),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.title,
                              style: const TextStyle(
                                  fontSize: 22, fontFamily: 'curvebold'),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Rs. ${widget.price}',
                              style: const TextStyle(
                                color: Color(0xffff6666),
                                fontSize: 21,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(
                              color: Colors.black,
                              height: 25,
                              thickness: 2,
                              indent: 5,
                              endIndent: 5,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Select Quantity',
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'curvebold'),
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (counter > 0) {
                                          counter -= 1;
                                        }
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.remove_rounded,
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.black38,
                                      ),
                                    ),
                                    child:
                                        Center(child: Text(counter.toString())),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (counter < 5) {
                                          counter += 1;
                                        }
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.add_rounded,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'Method of Payment',
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'curvebold'),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Container(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                  color: Colors.red.shade50,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: Colors.black26,
                                  ),
                                ),
                                child: DropdownButton(
                                  focusColor: Colors.transparent,
                                  // Initial Value
                                  value: dropdownvalue,
                                  // Down Arrow Icon
                                  icon: const Icon(
                                      Icons.arrow_drop_down_circle_rounded),
                                  // Array list of items
                                  items: dropdownitems.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownvalue = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            OrderChoice(category: widget.category),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'Delivery Fee',
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'curvebold'),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Rs. 200',
                              style: TextStyle(
                                color: Color(0xffff6666),
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'Total Price',
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'curvebold'),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Rs. $total',
                              style: const TextStyle(
                                color: Color(0xffff6666),
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: SizedBox(
                                height: 50,
                                width: 150,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.black87),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    )),
                                  ),
                                  onPressed: () {
                                    showAlertDialog(BuildContext context) {
                                      // set up the buttons
                                      Widget cancelButton = ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.black87),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          )),
                                        ),
                                        child: const Text("Cancel",
                                            style:
                                                TextStyle(color: Colors.white)),
                                        onPressed: () {
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop();
                                        },
                                      );
                                      Widget yesButton = ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.black87),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          )),
                                        ),
                                        child: const Text(
                                          "Yes",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        onPressed: () {
                                          addOrder(
                                              username,
                                              widget.title,
                                              widget.image,
                                              total.toString(),
                                              counter.toString(),
                                              dropdownvalue,
                                              widget.uid);
                                          FirebaseFirestore.instance
                                              .runTransaction((Transaction
                                                  myTransaction) async {
                                            await myTransaction
                                                .delete(widget.docid);
                                          });
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop();
                                          Navigator.pop(context);
                                        },
                                      );
                                      AlertDialog alert = AlertDialog(
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30.0))),
                                        title: const Text("Confirmation"),
                                        content: const Text(
                                            "Would you like to Confirm this Order?"),
                                        actions: [
                                          cancelButton,
                                          yesButton,
                                        ],
                                      );
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return alert;
                                        },
                                      );
                                    }

                                    showAlertDialog(context);
                                  },
                                  child: const Text(
                                    'Place Order',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontFamily: 'curvemedium'),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
