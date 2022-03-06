import 'package:flutter/material.dart';
import 'package:flutter_mvvm_clean_architecture/core/app_dependency.dart';
import 'package:flutter_mvvm_clean_architecture/data/store/user_store.dart';

class AboutPage extends StatelessWidget {
  final UserStore _userStore = dependencies<UserStore>();

  AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("about me: ${_userStore.name}"));
  }
}
