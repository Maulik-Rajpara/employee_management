mixin Validator {

  // Name validation
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  // validateRole
  String? validateRole(String? value) {
    if (value == null || value.isEmpty) {
      return 'Role is required';
    }
    return null;
  }

  String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Date selection is required';
    }
    return null;
  }


}