import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Most polpular movies',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (_, int index) {
                    return Container(
                        width: 150,
                        height: 150,
                        color: Colors.cyan,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        child: Column(children: [
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(context, 'details',
                                arguments: 'variables'),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: const FadeInImage(
                                width: 130,
                                height: 110,
                                placeholder:
                                    AssetImage('assets/placeholder.jpg'),
                                image: AssetImage('assets/placeholder.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Text(
                            'Movie Title',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          )
                        ]));
                  }))
        ],
      ),
    );
  }
}
