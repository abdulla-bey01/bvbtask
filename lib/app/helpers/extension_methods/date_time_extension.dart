extension DateTimeExtension on DateTime {
  bool isBetween(DateTime startDate, DateTime endDate) {
    return isAfter(startDate) && isBefore(endDate);
  }

  String getDayName() {
    String name = '';
    switch (weekday) {
      case 1:
        name = 'Mon';
        break;
      case 2:
        name = 'Tue';
        break;
      case 3:
        name = 'Wed';
        break;
      case 4:
        name = 'Thu';
        break;
      case 5:
        name = 'Fri';
        break;
      case 6:
        name = 'Sat';
        break;
      case 7:
        name = 'Sun';
        break;
      default:
        name = 'mon';
    }
    return name;
  }
}
