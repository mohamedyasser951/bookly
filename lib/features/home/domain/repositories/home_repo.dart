import 'package:bookly/core/network/failure.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNumber});
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks({int pageNumber});
}
