import 'package:bookly/core/serviceLocator/get_it._service.dart';
import 'package:bookly/features/home/presentation/HomeCubits/FeaturedBooksCubit/featured_book_cubit.dart';
import 'package:bookly/features/home/presentation/HomeCubits/NewestBooksCubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBookCubit(fetchFeaturedBooksUseCase: getIt())
                ..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(fetchNewestBooksUsecase: getIt()),
        ),
      ],
      child: MaterialApp(
        title: 'Bookly',
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: Colors.blue,
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
