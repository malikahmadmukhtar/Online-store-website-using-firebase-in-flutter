import 'package:e_com_app/data_screens/category_view.dart';
import 'package:flutter/cupertino.dart';

class HomeCategory extends StatefulWidget {
  const HomeCategory({super.key});

  @override
  State<HomeCategory> createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => CategoryView(title: 'Beauty')));
                },
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/beauty.png'),
                          fit: BoxFit.cover)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Beauty'),
            ],
          ), //Beauty
          const SizedBox(
            width: 20,
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => CategoryView(title: 'Mobiles')));
                },
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/mobiles.jpg'),
                          fit: BoxFit.cover)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Mobiles'),
            ],
          ),
          //Grocery
          const SizedBox(
            width: 15,
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => CategoryView(title: 'Watches')));
                },
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/watches.png'),
                          fit: BoxFit.cover)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Watches'),
            ],
          ), //Tech
          const SizedBox(
            width: 15,
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => CategoryView(title: 'Fashion')));
                },
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/fashion.png'),
                          fit: BoxFit.cover)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Fashion'),
            ],
          ) //Fashion
        ],
      ),
    );
  }
}
