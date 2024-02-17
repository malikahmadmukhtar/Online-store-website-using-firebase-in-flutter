import 'package:e_com_app/data_screens/category_view.dart';
import 'package:e_com_app/modal_classes/category_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CatergoryGrid extends StatefulWidget {
  const CatergoryGrid({super.key});

  @override
  State<CatergoryGrid> createState() => _CatergoryGridState();
}

class _CatergoryGridState extends State<CatergoryGrid> {
  static List<String> name = [
    'Laptops',
    'Beauty',
    'Fashion',
    'Home Appliances',
    'Earbuds',
    'Gadgets',
    'Mobiles',
    'Watches'
  ];
  static List image = [
    'assets/images/laptops.png',
    'assets/images/beauty.png',
    'assets/images/fashion.png',
    'assets/images/home_appliance.png',
    'assets/images/earbuds.png',
    'assets/images/gadgets.png',
    'assets/images/mobiles.jpg',
    'assets/images/watches.png'
  ];

  final List<CategoryModal> categoryData = List.generate(name.length,
      (index) => CategoryModal(name: name[index], image: image[index]));

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height / 1.13,
      child: GridView.builder(
          //shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 0, mainAxisSpacing: 0),
          itemCount: categoryData.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => CategoryView(
                                title: categoryData[index].name,
                              )));
                    },
                    child: Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          border: Border.all(
                            color: Colors.black26,
                          ),
                          image: DecorationImage(
                              image: AssetImage(categoryData[index].image),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(categoryData[index].name),
                ],
              ),
            );
          }),
    );
  }
}
