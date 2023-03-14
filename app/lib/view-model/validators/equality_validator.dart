import 'package:app/view/widgets/custom_snackbar.dart';

bool equalityValidate(String password1, String password2) {
  bool valid = password1 == password2;
  if (!valid) {
    CustomSnackBar.show('As senhas não correspondem!');
  }
  return valid;
}
