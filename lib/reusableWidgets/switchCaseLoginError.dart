import 'toastWidget.dart';

switchCaseError(e) {
  print(e.toString());
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
    case "wrong-password":
      long_flutter_toast("Password Incorrect");
      break;
    case "user-not-found":
      long_flutter_toast("User Not Registered");
      break;
    default:
      long_flutter_toast("An undefined Error happened.");
  }
  ;
}
