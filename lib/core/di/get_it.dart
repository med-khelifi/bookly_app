import 'package:bookly/core/api_client/api_client.dart';
import 'package:bookly/features/home/data/repos/home_repo_data.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiClient>(ApiClient(dio: getIt<Dio>()));
  getIt.registerSingleton<HomeRepoData>(
    HomeRepoData(apiClient: getIt<ApiClient>()),
  );
}
