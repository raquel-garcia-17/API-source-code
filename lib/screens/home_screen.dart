import 'package:flutter/material.dart';
import 'package:movies_new/providers/movies_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: true);

    return Scaffold(
        appBar:
            AppBar(elevation: 0, title: const Text('Lastest movies'), actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () {},
          )
        ]),
        body: Stack(children: [
          const Background(),
          SingleChildScrollView(
            child: Column(
              children: [
                CardSwiper(movies: moviesProvider.dataMovies),
                const CustomSlider()
                //Text('Home screen')
              ],
            ),
          ),
        ]));
  }
}
