import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  Failure({required this.message});
}

