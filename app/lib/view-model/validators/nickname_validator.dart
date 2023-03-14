import 'package:app/view/widgets/custom_snackbar.dart';

RegExp nickRegex = RegExp(
  r'^[a-zA-Z0-9]\w*$',
  multiLine: true,
);

bool nickValidate(String nick) {
  bool valid = nickRegex.hasMatch(nick);
  if (!valid) {
    CustomSnackBar.show('Nome inválido!');
  }
  return valid;
}
