import 'package:bookly/features/home/presentation/HomeCubits/NewestBooksCubit/newest_books_cubit.dart';
import 'package:bookly/features/home/presentation/widgets/NewestBookWidgets/newest_book_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBookBlocBuilder extends StatelessWidget {
  const NewestBookBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksFailureState) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else if (state is NewestBooksSuccessState) {
          return NewestBookBuilder(books: state.books);
        } else {
          return Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
