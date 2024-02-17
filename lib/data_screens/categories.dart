import 'package:e_com_app/widgets/category_widgets/category_list.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        toolbarHeight: 60,
        title: const Text('View Categories',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontFamily: 'curvemedium')),
        backgroundColor: Colors.black87,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black26,
                  ),
                ),
                child: const CatergoryGrid()),
          ),
        ),
      ),
    );
  }
}
