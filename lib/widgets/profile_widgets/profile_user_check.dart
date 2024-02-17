import 'package:e_com_app/widgets/profile_widgets/profile_view.dart';

import '../../firebase/firebase_functions.dart';
import '../../pages/login.dart';

checkProfileUser(String username, contact, address, email, uid) {
  if (checkUserState() == true) {
    return ProfileView(
      username: username,
      contact: contact,
      address: address,
      email: email,
      uid: uid,
    );
  } else {
    return const Login();
  }
}
