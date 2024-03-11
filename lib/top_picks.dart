import 'package:flutter/material.dart';
import 'package:learning_flutter/model/top_picks_model.dart';

class TopPicks extends StatelessWidget {
  const TopPicks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Picks'),
      ),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: topPicksList.length,
        itemBuilder: (context, index) {
          final TopPicksData = topPicksList[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: Column(
              children: [
                Image.network(TopPicksData.url ??
                    'https://i.ibb.co/86LP65y/false-2061131-640.png'),
                SizedBox(
                  height: 10,
                ),
                Wrap(
                  children: [
                    Icon(Icons.star),
                    Text('${TopPicksData.rating ?? 0.0}'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  TopPicksData.title ?? 'Title',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}