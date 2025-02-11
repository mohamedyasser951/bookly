import 'package:bookly/core/UseCases/use_case.dart';
import 'package:bookly/core/network/failure.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([int? params]) async {
    return await homeRepo.fetchFeaturedBooks(pageNumber: params ?? 0);
  }
}
