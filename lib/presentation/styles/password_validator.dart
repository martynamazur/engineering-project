
class PasswordValidator{
  
  // at least 6 characters
  // 1 upper letter
  // 1 supper letter
  // 1 special sign


  final RegExp _lengthRegExp = RegExp(r'^.{6,}$');
  final RegExp _uppercaseRegExp = RegExp(r'[A-Z]');
  final RegExp _lowercaseRegExp = RegExp(r'[a-z]');
  final RegExp _specialCharRegExp = RegExp(r'[!@#\$%^&*(),.?":{}|<>]');

  bool validate(String password){

    bool hasRequiredLength = _lengthRegExp.hasMatch(password);
    bool hasUppercase = _uppercaseRegExp.hasMatch(password);
    bool hasLowercase = _lowercaseRegExp.hasMatch(password);
    bool hasSpecialChar = _specialCharRegExp.hasMatch(password);

    return hasRequiredLength && hasUppercase && hasLowercase && hasSpecialChar;
  }
}