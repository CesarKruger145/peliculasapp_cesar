import 'package:flutter/material.dart';
import 'package:peliculasapp_cesar/widgets/card_swiper.dart';
import 'package:peliculasapp_cesar/widgets/movie_slider.dart';
import 'package:provider/provider.dart';

import '../providers/movies_providers.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MovieProviders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en cine'),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          CardSwiper(movies: moviesProvider.ondisplayMovies),
          MovieSlider(
            movies: moviesProvider.popularMovie,
            title: 'populares',
          )
        ]),
      ),
    );
  }
}
