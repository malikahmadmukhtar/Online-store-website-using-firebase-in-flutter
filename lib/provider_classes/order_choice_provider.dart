import 'package:flutter/foundation.dart';

class OrderChoiceProvider with ChangeNotifier {
  String defaultSize = 'Small';
  String defaultColor = 'White';

  void setColor(String value) {
    defaultColor = value;
    notifyListeners();
  }

  void setSize(String value) {
    defaultSize = value;
    notifyListeners();
  }
}
