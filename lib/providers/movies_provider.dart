import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = '85f4a7aa903061f743a4494a3bb860b1';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<dynamic> dataMovies = [];

  MoviesProvider() {
    this.getMovies();
  }

  get suggestionStream => null;

// https://api.themoviedb.org/3/movie/now_playing?api_key=c945246d58fe7690e457bea1e77ca786&language=en-US&page=1
  getMovies() async {
    var url = Uri.https(_baseUrl, '/3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      print(jsonResponse);

      dataMovies = jsonResponse["results"];
      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  getCastByMovie(int movieId) {}

  getMoviesRecommend(int movieIdToRecommend) {}

  void getSuggestionsByQuery(String query) {}
}
