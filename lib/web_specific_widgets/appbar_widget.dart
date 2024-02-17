import 'package:flutter/material.dart';

class AppBarWeb extends StatelessWidget {
  const AppBarWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: InkWell(
              onTap: () {},
              child: Image.asset(
                'assets/images/appicon.png',
                height: 50,
                width: 50,
              ),
            ),
          ),
        ),
        toolbarHeight: 70,
        title: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: TextButton(
              onPressed: () {},
              child: const Text('Shopping Zone',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'curvemedium')),
            )),
        backgroundColor: Colors.black87,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Row(
              children: [
                IconButton(
                    icon: const Icon(Icons.search, color: Colors.white),
                    padding: const EdgeInsets.only(right: 20),
                    onPressed: () {
                      // Navigator.of(context).push(CupertinoPageRoute(
                      //   builder: (context) => const SearchPage(),
                      // ));
                    }),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
