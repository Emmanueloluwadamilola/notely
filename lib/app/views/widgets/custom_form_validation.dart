class CustomFormValidation {
  static String errorMessage(
    String? text,
    String message,
  ) {
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else {
      return '';
    }
  }

  static bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#.\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static String validatePassword(
    String? text,
    String message,
  ) {
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (!validateStructure(text)) {
      return 'must contain uppercase, lowercase, numeric and any smymbol ';
    } else if (text.length < 8) {
      return 'password must have at least 8 characters';
    } else {
      return '';
    }
  }

  static String errorMessagePassword(String? text, String message) {
    if (text == null) {
      return '';
    }

    if (text.isEmpty) {
      return message;
    }
    if (text.length < 8) {
      return 'Password must have at least 8 characters';
    }

    if (!text.upper) {
      return 'password must contain uppercase letter(s)';
    }

    if (!text.digit) {
      return 'password must contain number(s)';
    }

    if (!text.symbol) {
      return 'password must contain symbols(s)';
    }

    if (!text.lower) {
      return 'password must contain lower letter(s)';
    }

    return '';
  }

  static String errorMessageFirst(
    String? text,
    String message,
  ) {
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (text.length <= 1) {
      return 'Invalid First name';
    } else {
      return '';
    }
  }

  static String errorMessageLast(
    String? text,
    String message,
  ) {
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (text.length <= 1) {
      return 'Invalid last name';
    } else {
      return '';
    }
  }

  static bool validateEmail(String value) {
    RegExp regExp = RegExp('[a-z0-9]+@[a-z]+.[a-z]');
    return regExp.hasMatch(value);
  }

  static String errorMessageEmail(
    String? text,
    String message,
  ) {
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (!validateEmail(text)) {
      return 'Invalid email';
    } else {
      return '';
    }
  }

  static String errorMessageRRR(
    String? text,
    String message,
  ) {
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (text.length <= 16) {
      return 'Invalid Code';
    } else {
      return '';
    }
  }

  static String errorMessagePhone(
    String? text,
    String message,
  ) {
    if (text == null) {
      return 'Phone is required';
    } else if (text.isEmpty) {
      return message;
    } else if (!text.isPhoneNumber()) {
      return 'Invalid Phone';
    } else {
      return '';
    }
  }
}

extension IsPhoneNumber on String {
  bool isPhoneNumber() {
    try {
      final value = toString();
      if (value.startsWith('+')) return true;
      int.parse(value);
      return true;
    } on FormatException {
      return false;
    }
  }
}

extension PasswordValidators on String {
  bool get upper => contains(RegExp(r'[A-Z]'));
  bool get lower => contains(RegExp(r'[a-z]'));
  bool get digit => contains(RegExp(r'[0-9]'));
  bool get symbol => contains(RegExp(r'[?=.\[!@#$&*~\]]'));
}
