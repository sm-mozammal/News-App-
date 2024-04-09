import 'package:bloc_practice/features/news/repository/news_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import '../network/dio/dio.dart';

final locator = GetIt.instance;
final box = locator.get<GetStorage>();

void diSetUp() {
  locator.registerSingleton<GetStorage>(GetStorage());
  // locator.registerSingleton<Dio>(Dio());

  // Initialize DioSingleton
  locator.registerSingleton<DioSingleton>(DioSingleton.instance);
  locator.registerLazySingleton<NewsRepository>(() => NewsRepository.instance);
}
