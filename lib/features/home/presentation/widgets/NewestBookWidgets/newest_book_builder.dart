import 'package:bookly/features/home/presentation/widgets/NewestBookWidgets/newest_book_item.dart';
import 'package:flutter/material.dart';

import 'package:bookly/features/home/domain/entities/book_entity.dart';

class NewestBookBuilder extends StatelessWidget {
  final List<BookEntity> books;
  const NewestBookBuilder({
    super.key,
    required this.books,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: books.length,
      separatorBuilder: (context, index) => SizedBox(
        height: 8.0,
      ),
      itemBuilder: (context, index) => NewestBookItem(bookEntity: books[index]),
    );
  }
}
