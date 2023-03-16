import 'package:app/view/widgets/custom_snackbar.dart';

RegExp passwordRegex = RegExp(
  r'^\w{6,}$',
  multiLine: true,
  caseSensitive: false,
);

bool passwordValidate(String password) {
  if (password.length < 6) {
    CustomSnackBar.show('A senha precisa ter ao menos 6 caracteres!');
    return false;
  }
  bool valid = passwordRegex.hasMatch(password);
  if (!valid) {
    CustomSnackBar.show('Formato de senha inválido!');
  }
  return valid;
}
