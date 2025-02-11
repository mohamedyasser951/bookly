import 'dart:developer';

import 'package:bookly/features/home/presentation/HomeCubits/FeaturedBooksCubit/featured_book_cubit.dart';
import 'package:bookly/features/home/presentation/widgets/FeaturedBookWidgets/featured_book_item.dart';
import 'package:flutter/material.dart';

import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBookListViewBuilder extends StatefulWidget {
  final List<BookEntity> books;
  const FeaturedBookListViewBuilder({
    super.key,
    required this.books,
  });

  @override
  State<FeaturedBookListViewBuilder> createState() =>
      _FeaturedBookListViewBuilderState();
}

class _FeaturedBookListViewBuilderState
    extends State<FeaturedBookListViewBuilder> {
  late ScrollController scrollController;
  int nextPage = 1;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
    super.initState();
  }

  void scrollListener() async {
    bool isLoading = false;
    double currentPosition = scrollController.position.pixels;
    double maxPosition = scrollController.position.maxScrollExtent;
    if (currentPosition >= maxPosition * 0.7 &&
        context.read<FeaturedBookCubit>().state
            is! FeaturedBookPaginationLoadingState) {
      if (!isLoading) {
        isLoading = true;
        context
            .read<FeaturedBookCubit>()
            .fetchFeaturedBooks(pageNumber: nextPage++);
        
        log("nextPage $nextPage");
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(scrollListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.3,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.books.length,
        separatorBuilder: (context, index) => SizedBox(
          width: 6.0,
        ),
        itemBuilder: (context, index) =>
            FeaturedBookItem(bookEntity: widget.books[index]),
      ),
    );
  }
}
