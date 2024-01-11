class MyFormValidator {
  static String? validateInt(int? value) {
    final val = value ?? '';
    if (val == 0) return 'Required';

    return null;
  }

  static String? validateEmail(String? val) {
    final value = val!.trim();
    if (value.isEmpty) return 'Required';

    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern as String);
    if (!(regex.hasMatch(value))) return 'Please enter a valid email address';
    return null;
  }

  static String? validateField(String? value, String feild) {
    if (value?.isEmpty ?? true) {
      return '$feild is required';
    } else {
      return null;
    }
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }

    // Regular expression to match names without numbers but with spaces
    final RegExp nameRegex = RegExp(r'^[a-zA-Z\s]+$');

    if (!nameRegex.hasMatch(value)) {
      return 'Invalid name';
    }

    return null;
  }

  static String? validateFields(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field is required';
    }

    return null;
  }
}
