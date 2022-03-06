import 'package:flutter/material.dart';
import 'package:flutter_mvvm_clean_architecture/app.dart';
import 'package:flutter_mvvm_clean_architecture/core/app_dependency.dart' as dependencies;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dependencies.setDependencies();
  runApp(const App());
}
