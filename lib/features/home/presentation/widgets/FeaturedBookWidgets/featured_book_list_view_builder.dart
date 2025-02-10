import 'package:bookly/features/home/presentation/widgets/FeaturedBookWidgets/featured_book_item.dart';
import 'package:flutter/material.dart';

import 'package:bookly/features/home/domain/entities/book_entity.dart';

class FeaturedBookListViewBuilder extends StatelessWidget {
  final List<BookEntity> books;
  const FeaturedBookListViewBuilder({
    super.key,
    required this.books,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.3,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        separatorBuilder: (context, index) => SizedBox(
          width: 6.0,
        ),
        itemBuilder: (context, index) =>
            FeaturedBookItem(bookEntity: books[index]),
      ),
    );
  }
}
