import 'package:hive_flutter/adapters.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String bookId;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String author;
  @HiveField(3)
  final String image;
  @HiveField(4)
  final num price;
  @HiveField(5)
  final num rating;

  BookEntity(
      {required this.bookId,
      required this.title,
      required this.author,
      required this.image,
      required this.price,
      required this.rating});
}
