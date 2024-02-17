import 'package:e_com_app/pages/login.dart';
import 'package:e_com_app/widgets/cart_widgets/cart_view.dart';
import '../../firebase/firebase_functions.dart';

checkCartUser()  {
  if (checkUserState() == true) {
    return CartView();
  } else {
    return Login();
  }
}
