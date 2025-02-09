import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

class BookListViewItem extends StatelessWidget {
  final BookEntity bookEntity;
  const BookListViewItem({super.key, required this.bookEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // GoRouter.of(context).push(AppRouter.KBookDetailView,extra: bookEntity);
      },
      child: SizedBox(
        height: 130,
        child: Row(
          children: [
            // CustomItem(
            //     imageUrl: bookEntity.volumeInfo.imageLinks?.thumbnail ?? ''),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      bookEntity.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    bookEntity.author,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          'Free',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const Spacer(),
                        // BookRating(
                        //   rating:
                        //       bookEntity.volumeInfo.averageRating?.round() ?? 0,
                        //   count: bookEntity.volumeInfo.ratingsCount ?? 0,
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
