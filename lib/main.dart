import 'package:bookly/app.dart';
import 'package:flutter/material.dart';

/// The main entry point for the app.
///
/// This function is the starting point for the app. It creates an instance of
/// [MyApp] and runs it.

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BooklyApp());
}
