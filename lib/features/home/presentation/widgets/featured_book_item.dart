import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FeaturedBookItem extends StatelessWidget {
  final BookEntity bookEntity;
  const FeaturedBookItem({super.key, required this.bookEntity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      width: 150,
      child: Card(
        elevation: 5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: CachedNetworkImage(
            // width: 170,
            imageUrl: bookEntity.image,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
