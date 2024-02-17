import 'package:e_com_app/web_specific_widgets/profile_web.dart';
import '../../firebase/firebase_functions.dart';
import 'cart_web.dart';
import 'login_web.dart';

checkCartUserWeb() {
  if (checkUserState() == true) {
    return const CartViewWeb();
  } else {
    return const LoginWeb();
  }
}

checkProfileUserWeb(String username, contact, address, email, uid) {
  if (checkUserState() == true) {
    return ProfileViewWeb(
      username: username,
      contact: contact,
      address: address,
      email: email,
      uid: uid,
    );
  } else {
    return const LoginWeb();
  }
}
