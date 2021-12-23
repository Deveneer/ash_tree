class CustomValidators {
  static String? passportValidator(passportNumber) {
    var passportRegEx = RegExp(r'^(?!^0+$)(?!^[A-Z]+$)[A-Z0-9]{3,20}$');
    if (passportRegEx.hasMatch(passportNumber!)) return null;
    return 'Enter a correct passport number!';
  }

  static String? emirateIdValidator(emirateId) {
    var emirateIDReg = RegExp("^[0-9]{3}-[0-9]{4}-[0-9]{7}-[0-9]{1}");
    if (emirateIDReg.hasMatch(emirateId!) && emirateId.toString().length == 18)
      return null;
    return 'Emirate id must be a 15 digit number!';
  }

  /*
    * Is valid dateOfBirth and dateOfBirthFormat
    * dateOfBirthFormat: dd/MM/yyyy
    * Valid: 01/12/1996
    * Invalid: 01/13/1996
  */
  static bool isValidDateOfBirth(String? dateOfBirth) {
    var dateOfBirthReg = RegExp("^[0-9]{2}/[0-9]{2}/[0-9]{4}");
    if (dateOfBirthReg.hasMatch(dateOfBirth!) &&
        dateOfBirth.toString().length == 10) {
      int day = 0, month = 0, year = 0;
      String dateOfBirthFormat = 'DD/MM/YYYY';
      DateTime present = DateTime.now();

      //Get separator data  10/10/2020, 2020-10-10, 10.10.2020 by deafult set to '/'.
      String separator =
          RegExp("([-/.])").firstMatch(dateOfBirthFormat)!.group(0)![0];

      //Split by separator [dd, mm, yyyy]
      List spliteddateOfBirthFormat = dateOfBirthFormat.split(separator);
      //Split by separtor [10, 10, 2020]
      List splitedDateOfBirth = dateOfBirth.split(separator);

      for (int i = 0; i < spliteddateOfBirthFormat.length; i++) {
        var format = spliteddateOfBirthFormat[i].toLowerCase();
        var value = splitedDateOfBirth[i];

        if (format == "dd")
          day = int.parse(value);
        else if (format == "mm")
          month = int.parse(value);
        else if (format == "yyyy")
          year = int.parse(value);
        else
          print('Format Error!');
      }

      if ((month >= 1 && month <= 12) &&
          (day >= 1 && day <= daysInMonth(month, year)) &&
          (year >= present.year - 100 && year < present.year))
        return true;
      else if (year == present.year) {
        if (month == present.month && day <= present.day) return true;
        if (month < present.month && day <= daysInMonth(month, year))
          return true;
        return false;
      }
      return false;
    }
    return false;
  }

  static int daysInMonth(int month, int year) {
    int days = 28 +
        (month + (month / 8).floor()) % 2 +
        2 % month +
        2 * (1 / month).floor();
    return (isLeapYear(year) && month == 2) ? 29 : days;
  }

  static bool isLeapYear(int year) => (year % 4 == 0);
}
