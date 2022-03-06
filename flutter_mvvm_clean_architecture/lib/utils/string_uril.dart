class UserStore {
  String? _name = null;
  String? _age = null;

  String? get name => _name;

  set name(String? name) {
    _name = name;
  }

  String? get age => _age;

  set age(String? age) {
    _age = age;
  }
}
