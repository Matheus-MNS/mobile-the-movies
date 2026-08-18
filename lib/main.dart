import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/errors/failure_messages.dart';

import 'core/utils/result.dart';
import 'repositories/movie_repository.dart';
import 'services/api/dio_client.dart';
import 'services/api/movie_service.dart';


void main() {
  runApp(const ProviderScope(child: MovieApp()));
}
class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(
          child: Text('Movie App - Em construção'),
        ),
      ),
    );
  }
}