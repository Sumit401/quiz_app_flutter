
import 'toastWidget.dart';

switchcase_error(e){
  switch (e.code) {
    case "email-already-in-use":
      long_flutter_toast("Your Email is already Registered.");
      break;
    case "invalid-email":
      long_flutter_toast("Enter Valid Email");
      break;
    case "weak-password":
      long_flutter_toast("Password should be at least 6 characters");
      break;
    default:
      long_flutter_toast("An undefined Error happened.");
  };
}