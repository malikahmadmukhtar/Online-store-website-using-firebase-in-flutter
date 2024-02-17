import 'package:e_com_app/widgets/cart_widgets/cart_user_check.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          title: const Text('Your Cart',
              style: TextStyle(
                  color: Colors.white, fontSize: 25, fontFamily: 'curvemedium')),
          backgroundColor: Colors.black87,
        ),
       body: checkCartUser()
    );  }
}
