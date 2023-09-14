// ignore_for_file: lines_longer_than_80_chars

extension DateTimeExt on DateTime {
  String get dateToISO8601 {
    Duration duration = timeZoneOffset;

    if (duration.isNegative) {
      return ("${toIso8601String()}-${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes - (duration.inHours * 60)).toString().padLeft(2, '0')}");
    } else {
      return ("${toIso8601String()}+${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes - (duration.inHours * 60)).toString().padLeft(2, '0')}");
    }
  }
}
