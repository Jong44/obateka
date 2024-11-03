class Formateddate {
  static String formatedDate(String date) {
    // 2024-10-10 -> 10/10/2024
    final dateParse = DateTime.parse(date);
    return "${dateParse.day}/${dateParse.month}/${dateParse.year}";
  }
}
