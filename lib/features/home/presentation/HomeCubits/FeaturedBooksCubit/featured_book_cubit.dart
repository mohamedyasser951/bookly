import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/usecases/fetch_featured_booke.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_book_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;
  FeaturedBookCubit({required this.fetchFeaturedBooksUseCase})
      : super(FeaturedBookInitial());

  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (state is FeaturedBookLoadingState ||
        state is FeaturedBookPaginationLoadingState) {
      return;
    }
    if (pageNumber == 0) {
      emit(FeaturedBookLoadingState());
    } else {
      emit(FeaturedBookPaginationLoadingState());
    }
    var result = await fetchFeaturedBooksUseCase.call(pageNumber);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(FeaturedBookFailureState(errorMessage: failure.message));
      } else {
        emit(FeaturedBookPaginationErrorState(errorMessage: failure.message));
      }
    }, (books) => emit(FeaturedBookSuccessState(books: books)));
  }
}
