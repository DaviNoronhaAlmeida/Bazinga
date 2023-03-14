import 'package:app/view/widgets/custom_snackbar.dart';

RegExp emailRegex = RegExp(r'^(\w{1,}\@\w{1,}\.\w{3}(\.\w{2}){0,1})$',
    multiLine: true, caseSensitive: false);

bool emailValidate(String email) {
  bool valid = emailRegex.hasMatch(email);
  if (!valid) {
    CustomSnackBar.show('Email inválido!');
  }
  return valid;
}
