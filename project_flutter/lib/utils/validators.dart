class Validators {

  // NAME
  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama wajib diisi';
    }

    return null;
  }

  // EMAIL
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email wajib diisi';
    }

    if (!value.contains('@')) {
      return 'Format email tidak valid';
    }

    return null;
  }

  // PASSWORD
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password wajib diisi';
    }

    if (value.length < 6) {
      return 'Password minimal 6 karakter';
    }

    return null;
  }

  // PHONE
  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nomor HP wajib diisi';
    }

    if (value.length < 10) {
      return 'Nomor HP minimal 10 digit';
    }

    return null;
  }
}