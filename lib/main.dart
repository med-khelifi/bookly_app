import 'package:bookly/app/bookly.dart';
import 'package:bookly/core/di/get_it.dart';
import 'package:flutter/material.dart';

void main() {
  setupDependencies();
  runApp(const Bookly());
}
