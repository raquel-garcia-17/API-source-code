import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  final List<dynamic> movies;

  const CardSwiper({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const base = "https://image.tmdb.org/t/p/w500";

    return Container(
      width: double.infinity,
      height: size.height,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemHeight: size.height * 1.2, //40%
        itemWidth: size.width * 0.5,
        itemBuilder: (_, int index) {
          final movie = movies[index];
          final imageUrl = base + movie["poster_path"];

          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: 'args'),
            child: ClipRRect(
              child: Column(
                children: [
                  FadeInImage(
                    placeholder: const AssetImage('assets/placeholder.jpg'),
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                  const Text("data")
                ],
              ),
            ),
          );
          //child: ClipRRect
        }, // 60%
      ),
    );
  }
}
