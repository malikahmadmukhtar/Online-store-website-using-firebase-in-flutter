import 'package:e_com_app/widgets/category_widgets/category_view_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  final String title;
  CategoryView({super.key, required this.title});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 60,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black87,
        title: Text(
          widget.title,
          style: const TextStyle(
              fontSize: 21, fontWeight: FontWeight.w400, color: Colors.white),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 15, left: 5, right: 5, bottom: 10),
        child: CategoryViewList(title: widget.title),
      ),
    );
  }
}
