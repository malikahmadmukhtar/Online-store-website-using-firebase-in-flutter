import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider_classes/order_choice_provider.dart';

class OrderChoice extends StatefulWidget {
  final String category;

  const OrderChoice({super.key, required this.category});

  @override
  State<OrderChoice> createState() => _OrderChoiceState();
}

class _OrderChoiceState extends State<OrderChoice> {
  var fashionSize = [
    'Small',
    'Medium',
    'Large',
  ];
  var itemColor = [
    'Black',
    'White',
    'Confirm After Order',
  ];

  @override
  Widget build(BuildContext context) {
    final choiceValue = Provider.of<OrderChoiceProvider>(context);

    if (widget.category == 'Fashion') {
      return Column(
        children: [
          const Text(
            'Choose Size',
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
              padding: const EdgeInsets.only(left: 10, right: 10),
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
                value: choiceValue.defaultSize,
                // Down Arrow Icon
                icon: const Icon(Icons.arrow_drop_down_circle_rounded),
                // Array list of items
                items: fashionSize.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    choiceValue.setSize(newValue!);
                  });
                },
              ),
            ),
          ),
        ],
      );
    } else if (widget.category == 'Laptops' ||
        widget.category == 'Earbuds' ||
        widget.category == 'Mobiles' ||
        widget.category == 'Watches') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Choose Color',
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
              padding: const EdgeInsets.only(left: 10, right: 10),
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
                value: choiceValue.defaultColor,
                // Down Arrow Icon
                icon: const Icon(Icons.arrow_drop_down_circle_rounded),
                // Array list of items
                items: itemColor.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    choiceValue.setColor(newValue!);
                  });
                },
              ),
            ),
          ),
        ],
      );
    } else {
      return const SizedBox(height: 0);
    }
  }
}
