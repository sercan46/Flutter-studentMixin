class Student {
  int? id;
  String? firstName;
  String? lastName;
  String? image;
  int? gradle;

  Student.withId(
      this.id, this.firstName, this.lastName, this.image, this.gradle);
  Student(this.firstName, this.lastName, this.gradle);

  String get getStatus {
    String message = '';
    if (gradle! >= 50) {
      message = 'Geçti';
    } else if (gradle! < 50 && gradle! > 40) {
      message = 'Bütünlemeye Kaldı';
    } else {
      message = 'Kaldı';
    }
    return message;
  }
}
