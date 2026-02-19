class AppValidators {
  AppValidators._(); // no instance

  static String? fullName(String? v) {
    final s = (v ?? "").trim();
    if (s.isEmpty) return "Full name is required";
    if (s.length < 3) return "Enter a valid full name";
    return null;
  }

  static String? email(String? v) {
    final s = (v ?? "").trim();
    if (s.isEmpty) return "Email is required";
    final ok = RegExp(r'^[\w\.\-]+@([\w\-]+\.)+[A-Za-z]{2,}$').hasMatch(s);
    if (!ok) return "Enter a valid email";
    return null;
  }

  static String? company(String? v) {
    final s = (v ?? "").trim();
    if (s.isEmpty) return "Company name is required";
    return null;
  }

  static String? city(String? v) {
    final s = (v ?? "").trim();
    if (s.isEmpty) return "City is required";
    return null;
  }

  static String? phoneOptional(String? v) {
    final s = (v ?? "").trim();
    if (s.isEmpty) return null; // optional
    final digits = s.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.length < 7) return "Enter a valid phone number";
    return null;
  }

  static String? websiteOptional(String? v) {
    final s = (v ?? "").trim();
    if (s.isEmpty) return null; // optional

    // Accept "example.com" too by adding scheme if missing
    final uri = Uri.tryParse(s.startsWith('http') ? s : 'https://$s');

    final ok = uri != null &&
        uri.hasScheme &&
        (uri.host.isNotEmpty); // host must exist

    if (!ok) return "Enter a valid website url";
    return null;
  }

  static String? gymName(String? v) {
    final s = (v ?? "").trim();
    if (s.isEmpty) return "Gym name is required";
    return null;
  }

  static String? contactName(String? v) {
    final s = (v ?? "").trim();
    if (s.isEmpty) return "Contact name is required";
    if (s.length < 3) return "Enter a valid contact name";
    return null;
  }
}