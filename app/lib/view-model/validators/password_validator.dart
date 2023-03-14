import 'package:app/view/widgets/custom_snackbar.dart';

RegExp passwordRegex = RegExp(
  r'^\w{6,}$',
  multiLine: true,
  caseSensitive: false,
);

bool passwordValidate(String password) {
  bool valid = passwordRegex.hasMatch(password);
  if (!valid) {
    CustomSnackBar.show('Senha inválida!');
  }
  return valid;
}
