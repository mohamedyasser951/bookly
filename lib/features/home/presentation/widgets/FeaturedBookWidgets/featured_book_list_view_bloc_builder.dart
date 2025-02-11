import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/HomeCubits/FeaturedBooksCubit/featured_book_cubit.dart';
import 'package:bookly/features/home/presentation/widgets/FeaturedBookWidgets/featured_book_list_view_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBookListViewBlocBuilder extends StatefulWidget {
  const FeaturedBookListViewBlocBuilder({super.key});

  @override
  State<FeaturedBookListViewBlocBuilder> createState() =>
      _FeaturedBookListViewBlocBuilderState();
}

class _FeaturedBookListViewBlocBuilderState
    extends State<FeaturedBookListViewBlocBuilder> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBookCubit, FeaturedBookState>(
      listener: (context, state) {
        if (state is FeaturedBookSuccessState) {
          books.addAll(state.books);
          setState(() {
            
          });
        }
        if (state is FeaturedBookPaginationErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        if (state is FeaturedBookFailureState) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else if (state is FeaturedBookSuccessState ||
            state is FeaturedBookPaginationErrorState ||
            state is FeaturedBookPaginationLoadingState) {
          return FeaturedBookListViewBuilder(books: books);
        } else {
          return Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
