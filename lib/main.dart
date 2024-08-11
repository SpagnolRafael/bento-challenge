import 'package:bento_challenge/app.dart';
import 'package:bento_challenge/injection/injection.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const App());
}
