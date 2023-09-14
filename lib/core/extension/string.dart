
extension StringExt on String {
  String get animated => 'assets/anim/$this.json';
  String get img => 'assets/images/$this.jpg';
  String get png => 'assets/images/$this.png';

  // get the first letter of every word
  String get initials => isNotEmpty
      ? trim().split(RegExp(' +')).map((String s) => s[0]).join()
      : '';

}
