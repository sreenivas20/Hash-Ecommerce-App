String? validatorpass(String? password) {
  if (password!.isEmpty || password == null) {
    return 'Enter password';
  }
  return null;
}

String? validatorname(String? name) {
  if (name!.isEmpty || name == null) {
    return 'Enter Name';
  }
  return null;
}

String? validatorEmail(String? name) {
  if (name!.isEmpty || name == null) {
    return 'Enter Email';
  }
  return null;
}

String? addressValidator(String? text) {
  if (text!.isEmpty || text == '') {
    return 'Field is reqired';
  }
  return null;
}
