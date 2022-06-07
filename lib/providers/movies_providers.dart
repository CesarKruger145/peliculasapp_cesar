import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculasapp_cesar/models/now_playing_response.dart';
import 'package:peliculasapp_cesar/models/popular_response.dart';

import '../models/movie.dart';

class MovieProviders extends ChangeNotifier {
  //crear las variables para usar con el http
  String _apikey = '1f99d58f69ed992fe3e31182fdfb076a';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  //crear este list para mostar las imagenes
  List<Movie> ondisplayMovies = [];
  List<Movie> popularMovie = [];

  MovieProviders() {
    print('MoviesProvider Inicializado');

    this.getOnDisplayMovies();
    this.getPopularMovies();
  }
  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apikey, 'language': _language, 'page': '1'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);

    final nowPlayinResponse = NowPlayinResponse.fromJson(response.body);
    print(nowPlayinResponse.results[1].title);
    ondisplayMovies = nowPlayinResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/popular',
        {'api_key': _apikey, 'language': _language, 'page': '1'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);

    final popularResponse = PopularResponse.fromJson(response.body);
    //print(popularResponse.results[1].title);
    popularMovie = [...popularMovie, ...popularResponse.results];
    notifyListeners();
  }
}
