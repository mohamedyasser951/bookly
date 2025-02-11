import 'package:bookly/app.dart';
import 'package:bookly/core/constants/bloc_observer.dart';
import 'package:bookly/core/constants/string_constants.dart';
import 'package:bookly/core/serviceLocator/get_it._service.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

/// The main entry point for the app.
///
/// This function is the starting point for the app. It creates an instance of
/// [MyApp] and runs it.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBooks);
  await Hive.openBox<BookEntity>(kNewestBooks);
  Bloc.observer = MyBlocObserver();
  runApp(BooklyApp());
}
