import 'package:bookly/features/home/presentation/HomeCubits/FeaturedBooksCubit/featured_book_cubit.dart';
import 'package:bookly/features/home/presentation/widgets/featured_book_list_view_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBookListViewBlocBuilder extends StatelessWidget {
  const FeaturedBookListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBookCubit, FeaturedBookState>(
      builder: (context, state) {
        if (state is FeaturedBookFailureState) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else if (state is FeaturedBookSuccessState) {
          return FeaturedBookListViewBuilder(books: state.books);
        } else {
          return Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
