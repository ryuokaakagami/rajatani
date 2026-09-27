class AppRegex {
  const new _();

  static final RegExp emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
  static final RegExp phoneRegex = RegExp(r"^(?:\+62|62|0)(?:8[1-9][0-9]{7,11})$");
}
