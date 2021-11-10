class StudentValidatonMixin {
  String? validateFirstName(String value) {
    if (value.length < 2) {
      return 'En az iki karakter giriniz';
    }
  }

  String? validateLasttName(String value) {
    if (value.length < 2) {
      return 'En az iki karakter giriniz';
    }
  }

  String? validateGradle(String value) {
    if (value.length < 2) {
      return 'En az iki karakter giriniz';
    } else {
      if (int.parse(value) > 100 || int.parse(value) < 0) {
        return '0-100 arası giriniz';
      }
    }
  }
}
