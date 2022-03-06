import 'package:flutter_mvvm_clean_architecture/core/app_extension.dart';
class UserStore {
  String? _name;
  String? _age;

  String? get name => _name;

  set name(String? name) {
    _name = name;
  }

  String? get age => _age;

  set age(String? age) {
    _age = age;
  }

  bool get hasUser {
    return name.isNotNull() && age.isNotNull();
  }
}
