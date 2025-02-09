import 'package:bookly/core/network/api_service.dart';
import 'package:bookly/features/home/data/datasources/LocalDataSource/home_local_data_source.dart';
import 'package:bookly/features/home/data/datasources/RemoteDataSource/home_remote_data_source.dart';
import 'package:bookly/features/home/data/repositories/home_repo_implem.dart';
import 'package:bookly/features/home/domain/repositories/home_repo.dart';
import 'package:bookly/features/home/domain/usecases/fetch_featured_booke.dart';
import 'package:bookly/features/home/domain/usecases/fetch_newest_books.dart';
import 'package:bookly/features/home/presentation/HomeCubits/FeaturedBooksCubit/featured_book_cubit.dart';
import 'package:bookly/features/home/presentation/HomeCubits/NewestBooksCubit/newest_books_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

/// Registers all the dependencies needed for the app to work
/// including Blocs, UseCases, Repositories and DataSources

GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  //*************************Cubits************************
  getIt.registerFactory<FeaturedBookCubit>(
      () => FeaturedBookCubit(fetchFeaturedBooksUseCase: getIt()));
  getIt.registerFactory<NewestBooksCubit>(
      () => NewestBooksCubit(fetchNewestBooksUsecase: getIt()));

  //*************************UseCases************************
  getIt.registerLazySingleton<FetchFeaturedBooksUseCase>(
      () => FetchFeaturedBooksUseCase(homeRepo: getIt()));
  getIt.registerLazySingleton<FetchNewestBooksUsecase>(
      () => FetchNewestBooksUsecase(homeRepo: getIt()));

  //*************************DataSources************************
  getIt.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(apiService: getIt()));

  //*************************Repositories************************
  getIt.registerLazySingleton<HomeLocalDataSource>(
      () => HomeLocalDataSourceImpl());

  //*************************Repositories************************
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImplem(
      homeRemoteDataSource: getIt(), homeLocalDataSource: getIt()));

//*************************ApiService************************
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio: getIt()));

//*************************Packages************************
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<HiveInterface>(() => Hive);
}
