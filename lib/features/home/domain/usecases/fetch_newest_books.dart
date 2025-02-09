import 'package:bookly/core/UseCases/use_case.dart';
import 'package:bookly/core/network/failure.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchNewestBooksUsecase extends UseCase<List<BookEntity>, NoParams> {
  final HomeRepo homeRepo;

  FetchNewestBooksUsecase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParams? params]) async {
    return await homeRepo.fetchNewestBooks();
  }
}
