import 'package:bookly/core/api_client/api_client.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/errors/server_failure.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoData implements HomeRepo {
  final ApiClient _apiClient;
  HomeRepoData({required ApiClient apiClient}) : _apiClient = apiClient;

  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSellingBooks() async {
    try {
      final data = await _apiClient.get(
        endPoint: '?filter=free-ebooks&q=subject:programming',
      );
      List<BookModel> books = [];
      for (var element in data['items']) {
        books.add(BookModel.fromJson(element));
      }
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromEx(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      final data = await _apiClient.get(
        endPoint: '?filter=free-ebooks&q=subject:programming',
      );
      List<BookModel> books = [];
      for (var element in data['items']) {
        books.add(BookModel.fromJson(element));
      }
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromEx(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
