import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/usecases/fetch_newest_books.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  FetchNewestBooksUsecase fetchNewestBooksUsecase;
  NewestBooksCubit({required this.fetchNewestBooksUsecase})
      : super(NewestBooksInitial());

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoadingState());
    var result = await fetchNewestBooksUsecase.call();
    result.fold(
        (failure) =>
            emit(NewestBooksFailureState(errorMessage: failure.message)),
        (books) => emit(NewestBooksSuccessState(books: books)));
  }
}
