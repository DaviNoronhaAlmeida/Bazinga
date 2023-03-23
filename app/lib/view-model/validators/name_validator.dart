import 'package:app/view/widgets/custom_snackbar.dart';

RegExp nameRegex = RegExp(
  r'^([a-z]{1,})([ ][a-z]{1,}){0,}$',
  multiLine: true,
  caseSensitive: false,
);

bool nameValidate(String name) {
  bool valid = nameRegex.hasMatch(name);
  if (!valid) {
    CustomSnackBar.show('Nome inválido!');
  }
  return valid;
}
